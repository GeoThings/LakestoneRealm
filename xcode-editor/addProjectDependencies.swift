#!/usr/bin/swift

import Foundation
import XcodeEditor

let swiftVersionString = "3.0.1"
let targetProjectPath = "LakestoneRealm.xcodeproj"
let iosDeploymentTarget = "8.0"
let targetsToBeModifiedNameContains = ["geoBingAnKit", "LakestoneRealm"]

let realmSwiftDirectoryPath = "$(SRCROOT)/realm-swift"

let frameworkSearchPathConfKey = "FRAMEWORK_SEARCH_PATHS"
let otherLinkerFlagsConfKey = "OTHER_LDFLAGS"
let runtimePathFlagsConfKey = "LD_RUNPATH_SEARCH_PATHS"
let iOSDeploymentTargetConfKey = "IPHONEOS_DEPLOYMENT_TARGET"
let supportedPlatformsTargetConfKey = "SUPPORTED_PLATFORMS"

enum Platform: String {
    case ios
    case tvos
    case watchos
    case osx
}

enum SDKComponent: String {
    case macosx
    case iphoneos
    case iphonesimulator
    case appletvos
    case appletvsimulator
    case watchos
    case watchsimulator
    
    var configurationSuffix: String {
        return "[sdk=\(self.rawValue)*]"
    }
    
    var designatedPlatform: Platform {
        switch self {
        case .macosx: return .osx
        case .iphoneos, .iphonesimulator: return .ios
        case .appletvos, .appletvsimulator: return .tvos
        case .watchos, .watchsimulator: return .watchos
        }
    }
    
    static var allSDKs: [SDKComponent] {
        return [.macosx, .iphoneos, .iphonesimulator, .appletvos, .appletvsimulator, .watchos, .watchsimulator]
    }
}

guard let lakestoneRealmProject = XCProject(filePath: targetProjectPath) else {
    print("Couldn't locate project at path: \(targetProjectPath)")
    exit(1)
}

let realmTargets = lakestoneRealmProject.targets().filter {
    for contained in targetsToBeModifiedNameContains {
        if $0.name.contains(contained) {
            return true
        }
    }
    return false
}

for realmTarget in realmTargets {
    for (_, configuration) in realmTarget.configurations() {
        
        // update Framework Search Paths
        for sdk in SDKComponent.allSDKs {
            let configurationKey = "\(frameworkSearchPathConfKey)\(sdk.configurationSuffix)"
            
            let frameworkSearchPath = ((realmSwiftDirectoryPath as NSString).appendingPathComponent(sdk.designatedPlatform.rawValue) as NSString).appendingPathComponent("swift-\(swiftVersionString)")
            configuration.addOrReplaceSetting([frameworkSearchPath] as NSArray, forKey: configurationKey)
        }
        
        // update Other Linker Frags
        let realmFrameworks = ["-framework", "Realm", "-framework", "RealmSwift"]
        configuration.addOrReplaceSetting(realmFrameworks as NSArray, forKey: otherLinkerFlagsConfKey)
        
        // add runtime path for test target
        if realmTarget.name.contains("Tests"){
            let runtimeSearchPath = ((realmSwiftDirectoryPath as NSString).appendingPathComponent(Platform.osx.rawValue) as NSString).appendingPathComponent("swift-\(swiftVersionString)")
            configuration.addOrReplaceSetting(realmFrameworks as NSArray, forKey: otherLinkerFlagsConfKey)
            var specifiedRuntimePaths = (configuration.specifiedBuildSettings[runtimePathFlagsConfKey] as? [String]) ?? [String]()
            specifiedRuntimePaths.append(runtimeSearchPath)
            configuration.addOrReplaceSetting(specifiedRuntimePaths as NSArray, forKey: runtimePathFlagsConfKey)
        }
    }
}

// global configs additions for all targets
for target in lakestoneRealmProject.targets() {
    for (_, configuration) in target.configurations() {
        
        let supportedPlatforms = SDKComponent.allSDKs.map { $0.rawValue }
        configuration.addOrReplaceSetting(supportedPlatforms as NSArray, forKey: supportedPlatformsTargetConfKey)
        configuration.addOrReplaceSetting(iosDeploymentTarget as NSString, forKey: iOSDeploymentTargetConfKey)
    }
}

lakestoneRealmProject.save()

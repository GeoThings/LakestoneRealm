swift build --clean dist
swift build -Xswiftc -Frealm-swift/osx/swift-3.0.1
swift package generate-xcodeproj
swift -Fxcode-editor xcode-editor/addProjectDependencies.swift

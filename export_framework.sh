#!/bin/sh

xcodebuild -project LakestoneRealm.xcodeproj -sdk iphoneos
cp -r build/Release-iphoneos/LakestoneRealm.framework ../GeoBingAnKit/Frameworks/Device/
xcodebuild -project LakestoneRealm.xcodeproj -sdk iphonesimulator
cp -r build/Release-iphonesimulator/LakestoneRealm.framework ../GeoBingAnKit/Frameworks/Simulator/
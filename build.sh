#!/bin/sh

rm -rf build/
rm -rf GreatSDK/build/
rm -rf GreatSDK/Pods/build/

xcodebuild clean archive -workspace GreatSDK/GreatSDK.xcworkspace -scheme "GreatSDK" \
            -sdk iphoneos OBJROOT=build/iOS SKIP_INSTALL=YES BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

xcodebuild clean archive -workspace GreatSDK/GreatSDK.xcworkspace -scheme "GreatSDK" \
            -sdk iphonesimulator OBJROOT=build/simulator SKIP_INSTALL=YES BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

xcodebuild -create-xcframework \
 -framework GreatSDK/build/iOS/UninstalledProducts/iphoneos/GreatSDK.framework \
 -framework GreatSDK/build/simulator/UninstalledProducts/iphonesimulator/GreatSDK.framework \
 -output build/GreatSDK.xcframework


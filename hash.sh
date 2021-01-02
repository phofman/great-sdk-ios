#!/bin/sh

pushd build/
zip -r GreatSDK.xcframework.zip GreatSDK.xcframework/

if [ -f Package.swift ]; then
  rm Package.swift
fi

swift package init --type manifest --name GreatSDK

echo
echo
echo "Computing package checksum:"
swift package compute-checksum GreatSDK.xcframework.zip

popd


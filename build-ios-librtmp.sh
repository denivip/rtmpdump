#!/bin/sh

IOS_VERSION=5.1
DEVICE_PLATFORM="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform"
SIMULATOR_PLATFORM="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform"
DEVICE_SDK="${DEVICE_PLATFORM}/Developer/SDKs/iPhoneOS${IOS_VERSION}.sdk"
SIMULATOR_SDK="${SIMULATOR_PLATFORM}/Developer/SDKs/iPhoneSimulator${IOS_VERSION}.sdk"
IOS_OPENSSL=../../ios-openssl

# armv7
cd librtmp

CROSS_COMPILE="${DEVICE_PLATFORM}/Developer/usr/bin/" \
XCFLAGS="-isysroot ${DEVICE_SDK} -I${IOS_OPENSSL}/include -arch armv7" \
XLDFLAGS="-isysroot ${DEVICE_SDK} -L${IOS_OPENSSL}/lib -arch armv7" \
make SYS=darwin SHARED=no &> /tmp/librtmp-armv7.log
make SYS=darwin prefix=../ install &> /tmp/librtmp-armv7.log

cd ..


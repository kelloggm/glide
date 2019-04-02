#!/bin/bash

# Script to setup a CSE machine to build TinyTravelTracker

export JAVA_HOME=/usr/lib/jvm/java-1.8.0/

if [ ! -d android-sdk ]; then
    mkdir android-sdk/
    cd android-sdk/
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
    unzip sdk-tools-linux-4333796.zip
    cd ..
fi

export ANDROID_HOME=`pwd`/android-sdk/

yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses

./gradlew clean build --continue -Dorg.gradle.daemon=false


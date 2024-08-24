#!/bin/bash

echo ========================================
echo = Building Journey Maps Client Flutter =
echo ========================================
fvm install
fvm flutter clean
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
echo ===========
echo = Testing =
echo ===========
fvm flutter test

cd example
echo ========================================
echo = Building Journey Maps Client Flutter =
echo ========================================
fvm install
fvm flutter clean
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
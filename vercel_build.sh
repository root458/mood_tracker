#!/bin/bash

# Download the Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to the path so we can invoke it
export PATH="$PATH:`pwd`/flutter/bin"

# Fetch project dependencies
flutter pub get

# Build the web application
flutter build web --target lib/main_production.dart --release

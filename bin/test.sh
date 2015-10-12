#!/bin/bash

echo Running Tests
xctool clean -workspace Connectastic.xcworkspace -scheme Connectastic -sdk iphonesimulator
xctool test -workspace Connectastic.xcworkspace -scheme Connectastic -sdk iphonesimulator



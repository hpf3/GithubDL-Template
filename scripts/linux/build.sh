#! /bin/bash

# create the output directory
mkdir build

#TODO edit script to match your project
# create standard directories (would be created by the installer, which we are emulating)
mkdir build/libs
mkdir build/data
mkdir build/logs
mkdir build/libs/Example
mkdir build/data/Example
mkdir build/logs/Example

# copy the source files to the output directory
cp example.lua build/example.lua

# copy the test data to the output directory if it exists
if [ -d testData ]; then
cp -r testData/* build/
fi
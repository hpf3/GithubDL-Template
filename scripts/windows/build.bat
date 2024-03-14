@echo off
REM #TODO: edit script to match your project
REM Create the output directory structure
if not exist build mkdir build
if not exist build\libs mkdir build\libs
if not exist build\data mkdir build\data
if not exist build\logs mkdir build\logs
if not exist build\libs\Example mkdir build\libs\Example
if not exist build\data\Example mkdir build\data\Example
if not exist build\logs\Example mkdir build\logs\Example

REM Copy the source files to the output directory
copy example.lua build\example.lua

REM Copy the test data to the output directory if it exists
if exist testData xcopy /E /I testData\* build\
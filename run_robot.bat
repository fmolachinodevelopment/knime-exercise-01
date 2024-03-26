@echo off
setlocal

rem Check if an argument is provided
if "%~1"=="" (
    echo Usage: %~nx0 ^<dir_path^>
    exit /b 1
)

rem Run the robot command with the provided directory path
robot -d output --loglevel TRACE %~1\
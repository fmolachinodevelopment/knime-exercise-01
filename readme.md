# Test Suite for the Given Exercise
[Exercise Doc](https://docs.google.com/document/d/13bGG6zig6ilz0Rj-jFqhkw2Q441OE3nC/edit?usp=drive_link&ouid=114701341578955750935&rtpof=true&sd=true)

## Overview
This test suite is implemented with robotframework and SeleniumLibrary.

## Prerequisites
- Python 3.12.2, and install the following, best under a python virtual enviorment (venv)
- `pip install robotframework`
- `pip install --upgrade robotframework-seleniumlibrary`
- Download Chrome Driver from [Chrome Driver Download](https://googlechromelabs.github.io/chrome-for-testing/#stable). Select the correct operating system and make sure the driver matches the browser version installed on your computer. Or use the chromedriver in this repository.

## Running the Test Suite
To run the test suite, open cmd CLI, then navigate to the root of this directory and execute the following line:
- `./run_robot.bat Tests/TestSuite.robot`

This will run the `TestSuite.robot` and create an output directory in which the logs and reports will be created.
Future executions of the .bat will overwrite the already created reports.

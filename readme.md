# Test Suite for the Given Exercise

## Overview
This test suite is implemented with robotframework and SeleniumLibrary.

## Prerequisites
- Python 3.12.2
- `pip install robotframework`
- `pip install --upgrade robotframework-seleniumlibrary`
- Download Chrome Driver from [Chrome Driver Download](https://googlechromelabs.github.io/chrome-for-testing/#stable). Select the correct operating system and make sure the driver matches the browser version installed on your computer.
- Before running the tests, you must initialize the webdriver via cmd as follows:
- `chromedriver --whitelisted-ips=""`


## Running the Test Suite
To run the test suite, open cmd CLI, then navigate to the root of this directory and execute the following line:
- `./run_robot.bat TestSuite.robot`

This will run the `TestSuite.robot` and create an Output directory in which the logs and reports will be created.

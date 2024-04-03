# Test Suite for the Given Exercise
[Exercise Doc](https://docs.google.com/document/d/13bGG6zig6ilz0Rj-jFqhkw2Q441OE3nC/edit?usp=drive_link&ouid=114701341578955750935&rtpof=true&sd=true)

## Overview
This test suite is implemented with robotframework and SeleniumLibrary.

## Prerequisites
- Python 3.12.2

## Installing Dependencies
- Clone this repository from [GitHub](https://github.com/fmolachinodevelopment/knime-exercise-01)
- Navigate to the directory in your terminal and execute the following command:
- `python -m venv venv`
- Activate the virtual environment. On Windows, execute the Activate.ps1 script located in venv/Scripts/ directory. Navigate to the directory venv/Scripts/ and run:
- `./Activate.ps1`
- After activating the virtual environment, return to the root directory of the project and run:
- `pip install -r requirements.txt`
- Once the installation finishes, the tests can be executed.

## Running the Test Suite
To run the test suite, open a command prompt (CLI), navigate to the root of this directory, and execute the following command:
- `./run_robot.bat Tests`

- This command will run all test files within the `Tests` directory and create an output directory where logs and reports will be generated. Subsequent executions using the .bat file will overwrite existing reports.
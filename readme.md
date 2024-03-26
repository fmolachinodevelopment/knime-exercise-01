Test Suite for the given exercise: https://docs.google.com/document/d/13bGG6zig6ilz0Rj-jFqhkw2Q441OE3nC/edit?usp=drive_link&ouid=114701341578955750935&rtpof=true&sd=true

Implemented with robotframework and SeleniumLibrary

Prerequisites: 
-python 3.12.2
-pip install robotframework
-pip install --upgrade robotframework-seleniumlibrary
-download chrome driver from https://googlechromelabs.github.io/chrome-for-testing/#stable
select the correct operative system and make sure the driver match the browser version installed in your computer 
-Before running the tests you must initialice the webdriver via cmd as follows:
chromedriver --whitelisted-ips=""

To run the test suite, open cmd CLI, then navegate to the root of this directory and execute the following line:
./run_robot.bat test.robot

This will run the test.robot suite, and create an Output directory in which the logs and reports will be created.
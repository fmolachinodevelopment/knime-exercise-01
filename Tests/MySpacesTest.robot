*** Settings ***
Documentation           Basic Login Test
Resource                ../resources/commonFunctionality.resource
Resource                ../resources/mySpaceKeywords.resource

#Before starting the test cases the following Setup will be executed.
#After the test end, the teadown occurs.
Suite Setup         Start Basic Setup
Suite Teardown      Close Application
Test Setup          Login Setup
#Test Teardown      Teardown


*** Variables ***
#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_

${SPACE NAME}    myspace
${CREATE N PUBLIC SPACES}    1


*** Test Cases ***
Create New Public Space
    Go To My Spaces
    My Spaces Page Should Be Open
    Create New Public Space    ${SPACE NAME}    ${VALID USERNAME}
    Space Should Be Created    ${SPACE NAME}


*** Keywords ***
Login Setup
    Go To Login Page
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials


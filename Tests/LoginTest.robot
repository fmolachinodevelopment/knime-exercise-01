*** Settings ***
Documentation           Login page test suite
Resource                ../resources/loginPage.resource

#Before starting the test cases the following Setup will be executed.
#After the test end, the teadown occurs.
Test Setup       Start Basic Setup
Test Teardown    Close Application


*** Variables ***
#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_

${INVALID USERNAME}     ------
${INVALID PASSWORD}     ------

*** Test Cases ***
Verify Valid Login
    [Documentation]       Verifies the valid login case
    Go To Login Page
    Title Should Be       ${LOG IN PAGE TITLE}
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials
    User Should Be Logged    ${VALID USERNAME}

Verify Invalid Login
    [Documentation]       Verifies the invalid login case
    Go To Login Page
    Input Credentials     ${INVALID USERNAME}    ${INVALID PASSWORD}
    Submit Credentials
    Wrong Credentials Alert Should Be Present

Verify Logout
    [Documentation]       Verifies the logout case
    Go To Login Page
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials
    Logout From Hub
    User Should Be Logged Out
    
Missing Password Login
    Go To Login Page
    Input Username    ${VALID USERNAME}
    Submit Credentials
    Missing Password Alert Should Be Present

Missing Username Login
    Go To Login Page
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Missing Username Alert Should Be Present

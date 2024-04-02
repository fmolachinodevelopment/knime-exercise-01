*** Settings ***
Documentation           Login page test suite - In order to change credentials, go to common.resource.
...                     It's encouraged to use a new account or with mySpaces default.
Resource                ../resources/pages/loginPage.resource
Resource                ../resources/pages/home.resource

#Before starting the test cases the following Setup will be executed.
#After the test end, the teadown occurs.
Test Setup       Initialize Browser To Login Page
Test Teardown    Close Browser


*** Variables ***
#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_

${INVALID USERNAME}     ------
${INVALID PASSWORD}     ------

*** Test Cases ***
Verify Valid Login Test
    [Documentation]       Verifies the valid login case
    Title Should Be       ${LOG IN PAGE TITLE}
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials
    User Should Be Logged    ${VALID USERNAME}

Verify Invalid Login Test
    [Documentation]       Verifies the invalid credentials login case
    Input Credentials     ${INVALID USERNAME}    ${INVALID PASSWORD}
    Submit Credentials
    Wrong Credentials Alert Should Be Present

Verify Logout Test
    [Documentation]       Verifies the logout case
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials
    Logout From Hub
    User Should Be Logged Out
    
Missing Password Login Test
    [Documentation]       Verifies the missing password login case
    Input Username    ${VALID USERNAME}
    Submit Credentials
    Missing Password Alert Should Be Present

Missing Username Login Test
    [Documentation]       Verifies the missing username login case
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Missing Username Alert Should Be Present

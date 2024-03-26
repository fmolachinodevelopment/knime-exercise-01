*** Settings ***
Documentation      Running TestSuite - add / delete public space
Resource           variables.resource
Resource           keywords.resource

*** Keywords ***

*** Variables ***
#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${VALID USERNAME}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    User Should Be Logged    ${VALID USERNAME}

Navigate To Spaces Page
    Open Spaces Page





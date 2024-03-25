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
    Sleep    ${DELAY}
    Input Password    ${VALID PASSWORD}
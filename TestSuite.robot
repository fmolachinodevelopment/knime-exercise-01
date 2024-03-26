*** Settings ***
Documentation      Running TestSuite - If executed via .bat file, the reports will be store
...                in the Output directory.

Resource           variables.resource
Resource           keywords.resource

*** Keywords ***

*** Variables ***
#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_
${SPACE NAME}           myNewSpace

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${VALID USERNAME}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    User Should Be Logged    ${VALID USERNAME}

Navigate To Spaces Page
    Open Spaces Page

New Public Space
    Create New Public Space    ${SPACE NAME}    ${VALID USERNAME}
    Space Should Be Created    ${SPACE NAME}

Delete Desire Space
    Delete Space    ${SPACE NAME}







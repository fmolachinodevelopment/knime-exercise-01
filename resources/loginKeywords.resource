*** Settings ***
Documentation    Keyword definitions
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
User Should Be Logged
    [Arguments]            ${username}
    Page Should Contain    ${username}

Wrong Credentials Alert Should Be Present 
   Page Should Contain Element    ${INVALID CREDENTIALS ALERT}

User Should Be Logged Out
    Page Should Contain Element    ${SIGN IN BUTTON}
    
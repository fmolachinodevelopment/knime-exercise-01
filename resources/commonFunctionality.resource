*** Settings ***
Documentation    Common keywords, shared setups and teardowns
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***

#Starts engine, enters hub page and close cookies pop up.
Start Basic Setup
    Open Browser          ${HUB PAGE URL}    ${BROWSER}
    Set Selenium Speed    ${SELENIUM SPEED}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW}    ${WAIT TIMEOUT}
    Click Element         ${CLOSE COOKIES WINDOW}

Go To Login Page
    Click Element         ${SIGN IN BUTTON}
    Wait Until Page Contains Element    ${INPUT USERNAME}    ${WAIT TIMEOUT}

Input Credentials
    [Arguments]           ${username}    ${password}
    Input Text            ${INPUT USERNAME}      ${username}
    Input Text            ${INPUT PASSWORD}      ${password}

Submit Credentials
    Click Element         ${SIGN IN SUBMIT}

Close Application
    Close Browser

Log Out From Hub
    Click Element                ${USER ICON}
    Element Should Be Visible    ${LOGOUT BUTTON}
    Click Element                ${LOGOUT BUTTON}
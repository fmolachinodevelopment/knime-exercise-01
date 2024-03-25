*** Settings ***
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${HUB PAGE URL}    ${BROWSER CHROME}
    Sleep               ${CHANGING PAGE DELAY}
    Click Element       ${CLOSE COOKIES WINDOW XPATH}
    Sleep               ${DELAY}
    Click Element       ${SIGN IN BUTTON XPATH}
    Sleep               ${CHANGING PAGE DELAY}
    Title Should Be     Log in | KNIME

Input Username
    [Arguments]    ${username}
    Input Text    ${INPUT USERNAME ID}      ${username}
    Sleep       1

Input Password
    [Arguments]    ${password}
    Input Text    ${INPUT PASSWORD ID}      ${password}
    Sleep       1




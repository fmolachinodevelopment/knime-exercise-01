*** Settings ***
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${HUB PAGE URL}    ${BROWSER CHROME}
    Sleep               ${CHANGING PAGE DELAY}
    Title Should Be     ${HUB TITLE}
    Maximize Browser Window
    Click Element       ${CLOSE COOKIES WINDOW XPATH}
    Sleep               ${DELAY}
    Click Element       ${SIGN IN BUTTON XPATH}
    Sleep               ${CHANGING PAGE DELAY}
    Title Should Be     ${LOG IN PAGE TITLE}

Input Username
    [Arguments]    ${username}
    Input Text    ${INPUT USERNAME ID}      ${username}
    Sleep   ${SMALL DELAY}

Input Password
    [Arguments]    ${password}
    Input Text    ${INPUT PASSWORD ID}      ${password}
    Sleep   ${SMALL DELAY}

Submit Credentials
    Click Element       ${SIGN IN SUBMIT ID}
    Sleep               ${SMALL DELAY}

User Should Be Logged
    [Arguments]    ${username}
    Page Should Contain     ${username}

Open Spaces Page
    Click Element               ${USER ICON XPATH}
    Element Should Be Enabled    ${USER SPACES BUTTON XPATH}
    Click Element               ${USER SPACES BUTTON XPATH}
    Sleep                       ${SMALL DELAY}
    Title Should Be             ${YOUR SPACES TITLE}

    






*** Settings ***
Documentation    Keyword definitions
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${HUB PAGE URL}    ${BROWSER CHROME}
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW XPATH}    ${DELAY}
    Title Should Be     ${HUB TITLE}
    Maximize Browser Window
    Click Element       ${CLOSE COOKIES WINDOW XPATH}
    Click Element       ${SIGN IN BUTTON XPATH}
    Wait Until Page Contains Element    ${INPUT USERNAME ID}    ${DELAY}
    Title Should Be     ${LOG IN PAGE TITLE}

Input Username
    [Arguments]         ${username}
    Input Text          ${INPUT USERNAME ID}      ${username}

Input Password
    [Arguments]         ${password}
    Input Text          ${INPUT PASSWORD ID}      ${password}

Submit Credentials
    Click Element       ${SIGN IN SUBMIT ID}
    Wait Until Page Contains Element    ${USER ICON XPATH}    ${DELAY}

User Should Be Logged
    [Arguments]         ${username}
    Page Should Contain     ${username}

Open Spaces Page
    Click Element                ${USER ICON XPATH}
    Element Should Be Enabled    ${USER SPACES BUTTON XPATH}
    Click Element                ${USER SPACES BUTTON XPATH}
    Wait Until Page Contains Element    ${PUBLIC SPACE XPATH}    ${DELAY}
    Title Should Be              ${YOUR SPACES TITLE}

Create New Public Space 
    [Arguments]        ${newSpaceName}    ${username}
    Click Element      ${PUBLIC SPACE XPATH}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX XPATH}    ${DELAY}
    Title Should Be    ${username}${EDITING SPACE TITLE}
    Input Text         ${EDIT PUBLIC SPACE BOX XPATH}    ${newSpaceName}
    Sleep              ${DELAY}
    Click Element      ${SAVE EDIT SPACE NAME XPATH}
    

Space Should Be Created
    [Arguments]               ${newSpaceName}    
    Wait Until Element Contains    ${CURRENT SPACE NAME XPATH}    ${newSpaceName}    ${DELAY}
    Element Text Should Be    ${CURRENT SPACE NAME XPATH}    ${newSpaceName}

Delete Space
    [Arguments]                  ${toDeleteSpaceName}
    Sleep    ${DELAY}
    Click Element                ${SPACE MENU BUTTON XPATH}
    Wait Until Element Is Visible    ${DELETE SPACE BUTTON XPATH}    ${DELAY}
    Element Should Be Enabled    ${DELETE SPACE BUTTON XPATH}
    Click Element                ${DELETE SPACE BUTTON XPATH}
    Wait Until Element Is Visible    ${DELETE SPACE NAME BOX XPATH}    ${DELAY}
    Input Text                   ${DELETE SPACE NAME BOX XPATH}    ${toDeleteSpaceName}
    Click Element                ${DELETE CONFIRMATION BUTTON XPATH}
    Wait Until Page Does Not Contain    ${toDeleteSpaceName}    ${DELAY}
    

#Wrong Credentials Alert Should Be Present 
#    Page Should Contain Element    ${INVALID CREDENTIALS ALERT XPATH}



    






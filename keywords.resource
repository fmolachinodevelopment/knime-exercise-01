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
    Click Element       ${SIGN IN BUTTON XPATH}
    Sleep               ${CHANGING PAGE DELAY}
    Title Should Be     ${LOG IN PAGE TITLE}

Input Username
    [Arguments]    ${username}
    Input Text    ${INPUT USERNAME ID}      ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${INPUT PASSWORD ID}      ${password}

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

Create New Public Space 
    [Arguments]    ${newSpaceName}    ${username}
    Click Element                ${PUBLIC SPACE XPATH}
    Sleep                        ${CHANGING PAGE DELAY}
    Title Should Be              ${username}${EDITING SPACE TITLE}
    Sleep                        ${DELAY}
    Input Text       ${EDIT PUBLIC SPACE BOX XPATH}    ${newSpaceName}
    Sleep            ${DELAY}
    Click Element    ${SAVE EDIT SPACE NAME XPATH}
    Sleep            ${DELAY}

Space Should Be Created
    [Arguments]    ${newSpaceName}    
    Sleep          ${DELAY}
    Element Text Should Be    ${CURRENT SPACE NAME XPATH}    ${newSpaceName}

Delete Space
    [Arguments]    ${toDeleteSpaceName}
    Click Element    ${SPACE MENU BUTTON XPATH}
    Sleep          ${DELAY}
    Element Should Be Enabled    ${DELETE SPACE BUTTON XPATH}
    Click Element       ${DELETE SPACE BUTTON XPATH}
    Sleep          ${DELAY}
    Input Text    ${DELETE SPACE NAME BOX XPATH}    ${toDeleteSpaceName}
    Sleep          ${DELAY}
    Click Element    ${DELETE CONFIRMATION BUTTON XPATH}
    Wait Until Page Does Not Contain    ${toDeleteSpaceName}    ${DELAY}
    Sleep    10
    #CHECK if back to spaces page
    #And finally check if view is as in first place



    






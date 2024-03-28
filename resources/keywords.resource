*** Settings ***
Documentation    Keyword definitions
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
Open Browser To Login Page
    Open Browser          ${HUB PAGE URL}    ${BROWSER}
    Set Selenium Speed    ${SELENIUM SPEED}  
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW}    ${WAIT TIMEOUT}
    Title Should Be       ${HUB TITLE}
    Maximize Browser Window
    Click Element         ${CLOSE COOKIES WINDOW}
    Click Element         ${SIGN IN BUTTON}
    Wait Until Page Contains Element    ${INPUT USERNAME}    ${WAIT TIMEOUT}
    Title Should Be       ${LOG IN PAGE TITLE}

Input Username
    [Arguments]           ${username}
    Input Text            ${INPUT USERNAME}      ${username}

Input Password
    [Arguments]           ${password}
    Input Text            ${INPUT PASSWORD}      ${password}

Submit Credentials
    Click Element         ${SIGN IN SUBMIT}
    Wait Until Page Contains Element    ${USER ICON}    ${WAIT TIMEOUT}

User Should Be Logged
    [Arguments]            ${username}
    Page Should Contain    ${username}

Open Spaces Page
    Click Element                ${USER ICON}
    Element Should Be Enabled    ${USER SPACES BUTTON}
    Click Element                ${USER SPACES BUTTON}
    Wait Until Page Contains Element    ${YOUR SPACES TITLE SEL}    ${WAIT TIMEOUT}
    Title Should Be              ${YOUR SPACES TITLE}

#Needed to use js, because if there are more than 3 li elements in the ul of my spaces, the xpath of create new
#space button changes because of the list length. 
Create New Public Space
    [Arguments]        ${newSpaceName}    ${username}
    ${public_space}    Execute JavaScript    return document.evaluate("//button[contains(., 'Public space')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    Click Element      ${public_space}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX}    ${WAIT TIMEOUT}
    Title Should Be    ${username}${EDITING SPACE TITLE}
    Input Text         ${EDIT PUBLIC SPACE BOX}    ${newSpaceName}
    Sleep              ${DELAY}
    Click Element      ${SAVE EDIT SPACE NAME}

Space Should Be Created
    [Arguments]                    ${newSpaceName}
    Wait Until Element Contains    ${CURRENT SPACE NAME}    ${newSpaceName}    ${WAIT TIMEOUT}
    Element Text Should Be         ${CURRENT SPACE NAME}    ${newSpaceName}

Delete Space
    [Arguments]                  ${toDeleteSpaceName}
    Sleep                        ${DELAY}   
    Click Element                ${SPACE MENU BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE BUTTON}    ${WAIT TIMEOUT}
    Element Should Be Enabled    ${DELETE SPACE BUTTON}
    Click Element                ${DELETE SPACE BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE NAME BOX}    ${WAIT TIMEOUT}
    Input Text                   ${DELETE SPACE NAME BOX}    ${toDeleteSpaceName}
    Click Element                ${DELETE CONFIRMATION BUTTON}
    Wait Until Page Does Not Contain    ${toDeleteSpaceName}    ${WAIT TIMEOUT}
    

Submit Wrong Credentials
    Click Element       ${SIGN IN SUBMIT}
    Wait Until Page Contains Element    ${INPUT USERNAME}    ${WAIT TIMEOUT}



    






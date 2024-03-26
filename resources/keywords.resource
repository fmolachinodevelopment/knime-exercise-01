*** Settings ***
Documentation    Keyword definitions
Library     SeleniumLibrary
Resource    variables.resource

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${HUB PAGE URL}    ${BROWSER CHROME}
    Set Selenium Speed    0.5 seconds   
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW XPATH}    ${WAIT TIMEOUT}
    Title Should Be     ${HUB TITLE}
    Maximize Browser Window
    Click Element       ${CLOSE COOKIES WINDOW XPATH}
    Click Element       ${SIGN IN BUTTON XPATH}
    Wait Until Page Contains Element    ${INPUT USERNAME ID}    ${WAIT TIMEOUT}
    Title Should Be     ${LOG IN PAGE TITLE}

Input Username
    [Arguments]         ${username}
    Input Text          ${INPUT USERNAME ID}      ${username}

Input Password
    [Arguments]         ${password}
    Input Text          ${INPUT PASSWORD ID}      ${password}

Submit Credentials
    Click Element       ${SIGN IN SUBMIT ID}
    Wait Until Page Contains Element    ${USER ICON XPATH}    ${WAIT TIMEOUT}

User Should Be Logged
    [Arguments]         ${username}
    Page Should Contain     ${username}

Open Spaces Page
    Click Element                ${USER ICON XPATH}
    Element Should Be Enabled    ${USER SPACES BUTTON XPATH}
    Click Element                ${USER SPACES BUTTON XPATH}
    Wait Until Page Contains Element    ${YOUR SPACES TITLE XPATH}    ${WAIT TIMEOUT}
    Title Should Be              ${YOUR SPACES TITLE}

#Needed to use js, because if there are more than 3 li elements in the ul of my spaces, the xpath of create new
#space button changes because of the list length.
Create New Public Space 
    [Arguments]        ${newSpaceName}    ${username}
    ${public_space}    Execute JavaScript    return document.evaluate("//button[contains(., 'Public space')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    Click Element      ${public_space}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX XPATH}    ${WAIT TIMEOUT}
    Title Should Be    ${username}${EDITING SPACE TITLE}
    Input Text         ${EDIT PUBLIC SPACE BOX XPATH}    ${newSpaceName}
    Sleep              ${DELAY}
    Click Element      ${SAVE EDIT SPACE NAME XPATH}

Space Should Be Created
    [Arguments]               ${newSpaceName}    
    Wait Until Element Contains    ${CURRENT SPACE NAME XPATH}    ${newSpaceName}    ${WAIT TIMEOUT}
    Element Text Should Be    ${CURRENT SPACE NAME XPATH}    ${newSpaceName}

Delete Space
    [Arguments]                  ${toDeleteSpaceName}
    Sleep    ${DELAY}
    Click Element                ${SPACE MENU BUTTON XPATH}
    Wait Until Element Is Visible    ${DELETE SPACE BUTTON XPATH}    ${WAIT TIMEOUT}
    Element Should Be Enabled    ${DELETE SPACE BUTTON XPATH}
    Click Element                ${DELETE SPACE BUTTON XPATH}
    Wait Until Element Is Visible    ${DELETE SPACE NAME BOX XPATH}    ${WAIT TIMEOUT}
    Input Text                   ${DELETE SPACE NAME BOX XPATH}    ${toDeleteSpaceName}
    Click Element                ${DELETE CONFIRMATION BUTTON XPATH}
    Wait Until Page Does Not Contain    ${toDeleteSpaceName}    ${WAIT TIMEOUT}
    

Submit Wrong Credentials
    Click Element       ${SIGN IN SUBMIT ID}
    Wait Until Page Contains Element    ${INPUT USERNAME ID}    ${WAIT TIMEOUT}

Wrong Credentials Alert Should Be Present 
   Page Should Contain Element    ${INVALID CREDENTIALS ALERT XPATH}



    






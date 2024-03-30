*** Settings ***
Documentation    My space keywords
Library     SeleniumLibrary
Resource    ../resources/common.resource


*** Variables ***
#Str variables:
${YOUR SPACES TITLE}              Your spaces – KNIME Community Hub
${EDITING SPACE TITLE}            /New space – KNIME Community Hub
${CREATE NEW SPACE TEXT}          Create new space
#Selectors variables:
${USER SPACES BUTTON}             //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/div/ul/li[1]/a/div/span
${YOUR SPACES TITLE SEL}          //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/h2
${EDIT PUBLIC SPACE BOX}          //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/textarea
${SAVE EDIT SPACE NAME}           //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/div/button[1]
${CURRENT SPACE NAME}             //*[@id="__layout"]/div/div[1]/section/nav/ul/li[4]/span
${SPACE MENU BUTTON}              //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/button
${DELETE SPACE BUTTON}            //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div/button
${DELETE SPACE NAME BOX}          //*[@id="confirmationForm"]/div/input
${DELETE CONFIRMATION BUTTON}     //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div[2]/div[2]/div/div[4]/button
${SPACES COUNT}                   //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div[1]/div/div/div/div[2]/div[1]/div/em[2]
${CREATE NEW PUBLIC SPACE BTN}    //div//button[contains(., "Public space")]
${FIRST NEW SPACE ON LIST}        //ul[class="card-list"]//div//h3[contains(., "New space")]
${SPACE SELECT BY NAME}           //ul[@class="card-list"]//div//h3


*** Keywords ***
Go To My Spaces
    Click Element    ${USER ICON}
    Wait Until Element Is Visible    ${USER SPACES BUTTON}
    Click Element    ${USER SPACES BUTTON}
    Wait Until Page Contains    ${YOUR SPACES TITLE}

My Spaces Page Should Be Open
    Title Should Be    ${YOUR SPACES TITLE}

Create New Named Public Space
    [Arguments]        ${newSpaceName}    ${username}
    Wait Until Element Is Visible    ${CREATE NEW PUBLIC SPACE BTN}
    Click Element      ${CREATE NEW PUBLIC SPACE BTN}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX}    ${WAIT TIMEOUT}
    Title Should Be    ${username}${EDITING SPACE TITLE}
    Input Text         ${EDIT PUBLIC SPACE BOX}    ${newSpaceName}
    Sleep              ${WAIT TIMEOUT}
    Click Element      ${SAVE EDIT SPACE NAME}
    Wait Until Element Contains    ${CURRENT SPACE NAME}    ${newSpaceName}


Space Should Be Created
    [Arguments]                    ${newSpaceName}
    Wait Until Element Contains    ${CURRENT SPACE NAME}    ${newSpaceName}    ${WAIT TIMEOUT}
    Element Text Should Be         ${CURRENT SPACE NAME}    ${newSpaceName}

Populate With Many Spaces
    [Documentation]                n spaces will be created
    [Arguments]                    ${nSpacesToCreate}
    Go To My Spaces

#This supose to be already on the edit space page
Delete Space
    Wait Until Page Contains Element    ${CURRENT SPACE NAME}
    ${spaceNameText}    Get Text    ${CURRENT SPACE NAME}
    Wait Until Element Is Visible    ${SPACE MENU BUTTON}
    Click Element    ${SPACE MENU BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE BUTTON}
    #Log To Console    SpaceName: ${spaceNameText}
    Click Element    ${DELETE SPACE BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE NAME BOX}
    Input Text    ${DELETE SPACE NAME BOX}    ${spaceNameText}
    Click Element    ${DELETE CONFIRMATION BUTTON}
    Wait Until Element Is Not Visible    ${DELETE CONFIRMATION BUTTON}
    Wait Until Page Contains    ${YOUR SPACES TITLE}    ${WAIT TIMEOUT}
    
Clear Created Space
    [Arguments]    ${toDeleteSpaceName}
    Sleep    3
    Go To My Spaces
    Wait Until Element Is Visible    ${SPACE SELECT BY NAME}\[contains(., "${toDeleteSpaceName}")]
    Click Element    ${SPACE SELECT BY NAME}\[contains(., "${toDeleteSpaceName}")]
    Delete Space

#Create New Public Space
    
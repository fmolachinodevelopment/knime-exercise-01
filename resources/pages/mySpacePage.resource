*** Settings ***
Documentation    My space page model. Keywords and locators
Library     SeleniumLibrary
Resource    ../resources/common.resource
Resource    ../components/navMenu.resource


*** Variables ***
#Text variables:
${YOUR SPACES TITLE}              Your spaces – KNIME Community Hub
${EDITING SPACE TITLE}            /New space – KNIME Community Hub

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
${CREATE NEW PUBLIC SPACE BTN}    //div//button[contains(., "Public space")]
${FIRST NEW SPACE ON LIST}        //ul[@class="card-list"]//div//h3[contains(text(), "New space")]
${SPACE SELECT BY NAME}           //ul[@class="card-list"]//div//h3
${ALREADY TAKEN NAME ERROR}       css:main section[class="pageheader"] div[class="error"]


*** Keywords ***
Go To My Spaces
    [Documentation]    Navigate to my spaces dashboard, needs to be already logged in.
    Click Element    ${USER ICON}
    Wait Until Element Is Visible    ${USER SPACES BUTTON}
    Click Element    ${USER SPACES BUTTON}
    ${alert_present}=    Run Keyword And Return Status    Alert Should Be Present    timeout=1s
    Run Keyword And Ignore Error    Handle Alert    timeout=1s
    Run Keyword    Wait Until Page Contains    ${YOUR SPACES TITLE}

My Spaces Page Should Be Open
    [Documentation]    Check if page title matchs "My Spaces Page"
    Title Should Be    ${YOUR SPACES TITLE}

Create New Named Public Space
    [Documentation]    Receives two str argument, and creates a new public space with newSpaceName as its name.
    [Arguments]        ${newSpaceName}    ${username}
    Wait Until Element Is Visible    ${CREATE NEW PUBLIC SPACE BTN}
    Click Element      ${CREATE NEW PUBLIC SPACE BTN}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX}
    Title Should Be    ${username}${EDITING SPACE TITLE}
    Input Text         ${EDIT PUBLIC SPACE BOX}    ${newSpaceName}
    Click Element      ${SAVE EDIT SPACE NAME}
    #TODO Replace following static wait:
    #Couldnt find a way to remove it Yet. When going back quickly, in myspaces the name of the space is not updated soon enough
    Sleep    3

Space Should Be Created
    [Documentation]    Checks if space was created, by looking the current space name.
    [Arguments]                    ${newSpaceName}
    Wait Until Element Contains    ${CURRENT SPACE NAME}    ${newSpaceName}
    Element Text Should Be         ${CURRENT SPACE NAME}    ${newSpaceName}

Delete Space
    [Documentation]    Deletes the current space beign edited. Needs to be on edit space page.
    Wait Until Page Contains Element    ${CURRENT SPACE NAME}
    ${spaceNameText}    Get Text    ${CURRENT SPACE NAME}
    Wait Until Element Is Visible    ${SPACE MENU BUTTON}
    Click Element    ${SPACE MENU BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE BUTTON}
    Click Element    ${DELETE SPACE BUTTON}
    Wait Until Element Is Visible    ${DELETE SPACE NAME BOX}
    Input Text    ${DELETE SPACE NAME BOX}    ${spaceNameText}
    Click Element    ${DELETE CONFIRMATION BUTTON}
    Wait Until Element Is Not Visible    ${DELETE CONFIRMATION BUTTON}
    Wait Until Page Contains    ${YOUR SPACES TITLE}

Create New Unnamed Space
    [Documentation]    Creates a new spaces, mantaining its default name.
    Wait Until Element Is Visible    ${CREATE NEW PUBLIC SPACE BTN}
    Click Element      ${CREATE NEW PUBLIC SPACE BTN}
    Wait Until Page Contains Element    ${EDIT PUBLIC SPACE BOX}

Already Taken Name Error Should Be Visible
    [Documentation]    Checks if warning for already taken name (duplicated) is visible.
    Wait Until Page Contains Element    ${ALREADY TAKEN NAME ERROR}
    Page Should Contain Element    ${ALREADY TAKEN NAME ERROR}

Clear Created Space
    [Documentation]    Receives one str argument, deletes the space with that argument as name.
    [Arguments]    ${toDeleteSpaceName}
    #Wait Until Page Contains    ${toDeleteSpaceName}
    Go To My Spaces
    ${locToDeleteSpace}    Set Variable    ${SPACE SELECT BY NAME}\[contains(., "${toDeleteSpaceName}")]
    Wait Until Element Is Visible    ${locToDeleteSpace}
    Click Element    ${locToDeleteSpace}
    Delete Space

Duplicated Name Cleanup
    [Documentation]    Deletes the space passed through arg and the first one matching str: "New space".
    [Arguments]    ${spaceName}
    Go To My Spaces
    #get the name of first new space created, and then delete it with "Clear Created Space"
    ${spaceName2}    Get Text    ${FIRST NEW SPACE ON LIST}
    Clear Created Space    ${spaceName}
    Wait Until Page Contains Element    ${CREATE NEW PUBLIC SPACE BTN}
    Clear Created Space    ${spaceName2}
    Wait Until Page Contains Element    ${CREATE NEW PUBLIC SPACE BTN}

Delete Created Space
    [Documentation]    Eliminates the space created and then close browser
    [Arguments]    ${toDeleteSpaceName}
    Clear Created Space    ${toDeleteSpaceName}
    Close Browser

Delete Both Spaces
    [Documentation]    Eliminates the multiple spaces created and then close browser
    [Arguments]    ${spaceName}
    Duplicated Name Cleanup    ${spaceName}
    Close Browser

#Not currently in use
# Populate With Many Spaces
#     [Documentation]                Receives one n int argument, creates n new spaces.
#     [Arguments]                    ${nSpacesToCreate}
#     Go To My Spaces
#     ${counter}    Set Variable    0
#     FOR    ${counter}    IN RANGE    ${nSpacesToCreate}
#         Create New Unnamed Space
#         Go To My Spaces
#         ${counter}=    Evaluate    ${counter} + 1
#     END

#Clean Up Unnamed Spaces
#Use ${FIRST NEW SPACE ON LIST} to locate the element to be eliminated, and iterate this
#If its the already taken error, also delete the named one
#TODO take away sleeps, look for another way, make it dinamic.

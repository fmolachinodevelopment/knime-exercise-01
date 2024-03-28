*** Settings ***
Documentation    My space keywords
Library     SeleniumLibrary
Resource    variables.resource


*** Keywords ***
Go To My Spaces
    Click Element    ${USER ICON}
    Click Element    ${USER SPACES BUTTON}
    Wait Until Page Contains    ${YOUR SPACES TITLE}

My Spaces Page Should Be Open
    Title Should Be    ${YOUR SPACES TITLE}

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

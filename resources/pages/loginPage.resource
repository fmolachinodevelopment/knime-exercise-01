*** Settings ***
Documentation    Login page model. Keywords and locators
Library     SeleniumLibrary
Resource    ../resources/common.resource
Resource    ../components/navMenu.resource


*** Variables ***
#Str variables:
${HUB TITLE}                      KNIME Community Hub
${LOG IN PAGE TITLE}              Log in | KNIME
#Locators:
${CLOSE COOKIES WINDOW}           //*[@id="__layout"]/div/div[4]/div[2]/div/div[1]/button
${SIGN IN BUTTON}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${INPUT USERNAME}                 id:edit-name
${INPUT PASSWORD}                 id:edit-pass
${SUBMIT CREDENTIALS BUTTON}      id:edit-submit
${LOGOUT BUTTON}                  css:div[class="login"] ul [href="/_/auth/logout"]
${INVALID CREDENTIALS ALERT}      //*[@id="user-login-form"]/div[1]/div[1]
${MISSING PASS ALERT}             //form[@id="user-login-form"]//div[contains(., "Password field is required.")]
${MISSIN USERNAME ALERT}          //form[@id="user-login-form"]//div[contains(., "Username or email address. field is required.")]


*** Keywords ***
Input Credentials
    [Arguments]           ${username}    ${password}
    Input Username        ${username}
    Input Password        ${password}

Input Username
    [Arguments]           ${username}
    Input Text            ${INPUT USERNAME}      ${username}

Input Password
    [Arguments]           ${password}
    Input Text            ${INPUT PASSWORD}      ${password}

Submit Credentials
    Click Element         ${SUBMIT CREDENTIALS BUTTON}

Log Out From Hub
    Click Element                ${USER ICON}
    Element Should Be Visible    ${LOGOUT BUTTON}
    Click Element                ${LOGOUT BUTTON}

User Should Be Logged
    [Arguments]            ${username}
    Page Should Contain    ${username}

Wrong Credentials Alert Should Be Present
   Page Should Contain Element    ${INVALID CREDENTIALS ALERT}

User Should Be Logged Out
    Wait Until Page Contains Element    ${SIGN IN BUTTON}
    Page Should Contain Element    ${SIGN IN BUTTON}

Missing Password Alert Should Be Present
    Wait Until Page Contains Element    ${MISSING PASS ALERT}
    Page Should Contain Element    ${MISSING PASS ALERT}

Missing Username Alert Should Be Present
    Wait Until Page Contains Element    ${MISSIN USERNAME ALERT}
    Page Should Contain Element    ${MISSIN USERNAME ALERT}
    
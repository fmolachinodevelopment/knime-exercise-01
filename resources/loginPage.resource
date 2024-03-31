*** Settings ***
Documentation    Login Page (elements and keywords)
Library     SeleniumLibrary
Resource    ../resources/common.resource


*** Variables ***
#Str variables:
${HUB TITLE}                      KNIME Community Hub
${LOG IN PAGE TITLE}              Log in | KNIME
${CLOSE COOKIES WINDOW}           //*[@id="__layout"]/div/div[4]/div[2]/div/div[1]/button
${SIGN IN BUTTON}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${INPUT USERNAME}                 edit-name
${INPUT PASSWORD}                 edit-pass
${SIGN IN SUBMIT}                 edit-submit
${LOGOUT BUTTON}                  css:div[class="login"] ul [href="/_/auth/logout"]
${INVALID CREDENTIALS ALERT}      //*[@id="user-login-form"]/div[1]/div[1]
${MISSING PASS ALERT}             //form[@id="user-login-form"]//div[contains(., "Password field is required.")]
${MISSIN USERNAME ALERT}          //form[@id="user-login-form"]//div[contains(., "Username or email address. field is required.")]


*** Keywords ***
#Starts engine, enters hub page and close cookies pop up.
Start Basic Setup
    Open Browser          ${HUB PAGE URL}    ${BROWSER}
    Set Selenium Speed    ${SELENIUM SPEED}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW}    ${WAIT TIMEOUT}
    Click Element         ${CLOSE COOKIES WINDOW}

Close Application
    Close Browser

Go To Login Page
    Wait Until Page Contains Element    ${SIGN IN BUTTON}
    Click Element         ${SIGN IN BUTTON}
    Wait Until Page Contains Element    ${INPUT USERNAME}    ${WAIT TIMEOUT}

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
    Click Element         ${SIGN IN SUBMIT}

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
    
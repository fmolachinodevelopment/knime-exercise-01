*** Settings ***
Documentation    ...TODO
Library     SeleniumLibrary
Resource    ../resources/common.resource
Resource    ../components/navMenu.resource


*** Variables ***
#Str variables:

#Locators:
${CLOSE COOKIES WINDOW}           //*[@id="__layout"]/div/div[4]/div[2]/div/div[1]/button
${SIGN IN BUTTON}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button


*** Keywords ***
#Starts engine, enters hub page and close cookies pop up.
Initialize Browser To Login Page
    [Documentation]    Open browser, set selenium speed, maximize window and close the cookies pop up.
    Open Browser          ${HUB PAGE URL}    ${BROWSER}
    Set Selenium Speed    ${SELENIUM SPEED}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CLOSE COOKIES WINDOW}
    Click Element         ${CLOSE COOKIES WINDOW}
    Go To Log In Page

Go To Login Page
    [Documentation]    Navigate to login page, by clicking sign in button
    Wait Until Page Contains Element    ${SIGN IN BUTTON}
    Click Element         ${SIGN IN BUTTON}
    Wait Until Element Is Not Visible    ${HUB HOME LINK}

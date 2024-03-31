*** Settings ***
Documentation    Resource for common variables, like the user icon...


*** Variables ***
#Browser and url variables:
${HUB PAGE URL}               https://hub.knime.com/
${BROWSER}                    Chrome
#Timeouts and delay vars:
${WAIT TIMEOUT}               3
${SELENIUM SPEED}             0 seconds
#Selectors variables:
${USER ICON}                  css:nav[role="navigation"] div[class="login"] button

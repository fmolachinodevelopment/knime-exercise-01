*** Settings ***
Documentation    Resource for common variables (used almost in any test case).


*** Variables ***
#Browser and url variables:
${HUB PAGE URL}               https://hub.knime.com/
${BROWSER}                    Chrome

#Timeouts and delay vars:
${WAIT TIMEOUT}               3
${SELENIUM SPEED}             0 seconds

#Credentials
${VALID USERNAME}       qaknimeweb
${VALID PASSWORD}       0qAknimeweb0_

${INVALID USERNAME}     ------
${INVALID PASSWORD}     ------
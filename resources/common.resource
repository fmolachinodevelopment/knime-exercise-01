*** Settings ***
Documentation    Resource for common variables, like the user icon...


*** Variables ***
#Browser and url variables:
${HUB PAGE URL}               https://hub.knime.com/
${BROWSER}                    Chrome
#Timeouts and delay vars:
${WAIT TIMEOUT}               4
${SELENIUM SPEED}             0 seconds
#Elements
${USER ICON}                  //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button/div/div/div

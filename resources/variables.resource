*** Settings ***
Documentation    Resource for variables - any change on XPATH or other selector must be 
...              updated here. If running the tests with less latency
...              you should consider to lower the delay rates. It will optimize the 
...              execution times.


*** Variables ***

#Str variables:
${HUB TITLE}                            KNIME Community Hub
${LOG IN PAGE TITLE}                    Log in | KNIME
${YOUR SPACES TITLE}                    Your spaces – KNIME Community Hub
${EDITING SPACE TITLE}                  /New space – KNIME Community Hub
${CREATE NEW SPACE TEXT}                Create new space
#Browser and url variables:
${HUB PAGE URL}                         https://hub.knime.com/
${BROWSER}                              Chrome
#Selectors variables:            
${CLOSE COOKIES WINDOW}           //*[@id="__layout"]/div/div[4]/div[2]/div/div[1]/button
${SIGN IN BUTTON}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${INPUT USERNAME}                 edit-name
${INPUT PASSWORD}                 edit-pass
${SIGN IN SUBMIT}                 edit-submit
${USER ICON}                      //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button/div/div/div

${INVALID CREDENTIALS ALERT}      //*[@id="user-login-form"]/div[1]/div[1]
${SPACES COUNT}                   //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div[1]/div/div/div/div[2]/div[1]/div/em[2]
${LOGOUT BUTTON}                  css:div[class="login"] ul [href="/_/auth/logout"]
*** Settings ***
Documentation    Resource for variables - any change on XPATH or other selector must be 
...              updated here. If running the tests more close to the web host
...              you should consider to lower the delay rates. It will optimize the 
...              execution times.


*** Variables ***
#Timeouts and delay vars
${SMALL DELAY}                1
${CHANGING PAGE DELAY}        2
${DELAY}                      4
${WAIT TIMEOUT}               5

#Browser and url variables
${HUB PAGE URL}                         https://hub.knime.com/
${BROWSER CHROME}                       Chrome
${HUB TITLE}                            KNIME Community Hub
${LOG IN PAGE TITLE}                    Log in | KNIME
${YOUR SPACES TITLE}                    Your spaces – KNIME Community Hub
${EDITING SPACE TITLE}                  /New space – KNIME Community Hub
${CREATE NEW SPACE TEXT}                Create new space

#Selectors variables                    
${CLOSE COOKIES WINDOW XPATH}           //*[@id="__layout"]/div/div[4]/div[2]/div/div[1]/button
${SIGN IN BUTTON XPATH}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${INPUT USERNAME ID}                    edit-name
${INPUT PASSWORD ID}                    edit-pass
${SIGN IN SUBMIT ID}                    edit-submit
${USER ICON XPATH}                      //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button/div/div/div
${USER SPACES BUTTON XPATH}             //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/div/ul/li[1]/a/div/span

${YOUR SPACES TITLE XPATH}                   //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/h2

${EDIT PUBLIC SPACE BOX XPATH}          //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/textarea
${SAVE EDIT SPACE NAME XPATH}           //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/div/button[1]
${CURRENT SPACE NAME XPATH}             //*[@id="__layout"]/div/div[1]/section/nav/ul/li[4]/span
${SPACE MENU BUTTON XPATH}              //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/button
${DELETE SPACE BUTTON XPATH}            //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div/button
${DELETE SPACE NAME BOX XPATH}          //*[@id="confirmationForm"]/div/input
${DELETE CONFIRMATION BUTTON XPATH}     //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div[2]/div[2]/div/div[4]/button
${INVALID CREDENTIALS ALERT XPATH}      //*[@id="user-login-form"]/div[1]/div[1]

${SPACES COUNT XPATH}                   //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div[1]/div/div/div/div[2]/div[1]/div/em[2]





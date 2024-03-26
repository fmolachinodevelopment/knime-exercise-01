*** Settings ***
Documentation           Running NegativeTestSuite - If executed via .bat file, the reports will be store
...                     in the output directory.

Resource                ../resources/variables.resource
Resource                ../resources/keywords.resource

*** Keywords ***

*** Variables ***
#Credentials
${INVALID USERNAME}     notusername
${INVALID PASSWORD}     notpassword

*** Test Cases ***
Invalid Login
    Open Browser To Login Page
    Input Username           ${INVALID USERNAME}
    Input Password           ${INVALID PASSWORD}
    Submit Wrong Credentials
    Wrong Credentials Alert Should Be Present
    Close Browser
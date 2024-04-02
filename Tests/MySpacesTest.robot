*** Settings ***
Documentation           MySpace page test suite. In order to function properly, the account logged
...                     in should have a default "my spaces" (under this view, there should be only
...                     visible 3 things: Private, Public and Create new space CARDS)

Resource                ../resources/pages/home.resource
Resource                ../resources/pages/loginPage.resource
Resource                ../resources/pages/mySpacePage.resource

#Before starting the test cases the following Setup will be executed.
Test Setup         Run Keywords    Initialize Browser To Login Page    Login Setup    Go To My Spaces


*** Variables ***
${SPACE NAME}    myspace
#Not currently in use
# ${CREATE N PUBLIC SPACES}    2


*** Test Cases ***
Create New Public Space Test
    [Documentation]    Create a new public space, assert if it was created, and then deletes it
    Create New Named Public Space    ${SPACE NAME}    ${VALID USERNAME}
    Space Should Be Created    ${SPACE NAME}
    [Teardown]    Delete Created Space    ${SPACE NAME}

Edit Space With Duplicated Name Test
    [Documentation]    Create two spaces, and tries to edit the name of the later with the same as the first one.
    ...                Then checks if alert for already taken name takes place, and then deletes both spaces.
    My Spaces Page Should Be Open
    Create New Named Public Space    ${SPACE NAME}    ${VALID USERNAME}
    Go To My Spaces
    Create New Named Public Space    ${SPACE NAME}    ${VALID USERNAME}
    Already Taken Name Error Should Be Visible
    [Teardown]    Delete Both Spaces    ${SPACE NAME}


*** Keywords ***
Login Setup
    [Documentation]    Navigate to login page, input credentials and submit them.
    Input Credentials     ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Credentials

# Create Multiple Public Spaces - Another posible setup?
#     Populate With Many Spaces    ${CREATE N PUBLIC SPACES}
    #how to verify if n spaces were created? 
    #1-Could be by looking up the spaces counter
    #2-Could be by taking the length of the ul containing them
    #3-
    #Need a proper teardown, which eliminates all of the created spaces

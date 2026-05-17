*** Settings ***
Documentation       Question 4: Minimal-Todo mobile automation using Robot Framework + AppiumLibrary.
Library             AppiumLibrary
Test Setup          Open Minimal Todo App
Test Teardown       Close Application


*** Variables ***
${APPIUM_SERVER}            http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}            Android
${AUTOMATION_NAME}          UiAutomator2
${DEVICE_NAME}              Android Emulator
${APP_PATH}                 C:/Users/acer/Desktop/TTB/TTB_Assignment/app/minimal-todo.apk

${ADD_TASK_BUTTON}          id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
${TITLE_FIELD}              id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
${SAVE_BUTTON}              id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
${REMINDER_SWITCH}          id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat


*** Test Cases ***
Create Todo Item Successfully
    [Documentation]    Verify user can create a todo with title.
    Tap Add Todo
    Input Text    ${TITLE_FIELD}    Buy milk
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains    Buy milk

Create Todo With Reminder
    [Documentation]    Verify user can create a todo with reminder enabled.
    Tap Add Todo
    Input Text    ${TITLE_FIELD}    Pay credit card
    Click Element    ${REMINDER_SWITCH}
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains    Pay credit card

Edit Existing Todo Item
    [Documentation]    Verify user can open an existing todo and update its title.
    Create Todo    Draft title
    Open Todo By Title    Draft title
    Clear Text    ${TITLE_FIELD}
    Input Text    ${TITLE_FIELD}    Updated title
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains    Updated title

Delete Existing Todo Item
    [Documentation]    Verify user can delete an existing todo item.
    Create Todo    Remove me
    Wait Until Page Contains    Remove me
    Hide Keyboard
    Sleep    1s
    Swipe By Percent    90    15    10    15    500 ms
    Wait Until Page Does Not Contain    Remove me

Validate Required Todo Title
    [Documentation]    Verify empty title cannot create a todo item.
    Tap Add Todo
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains Element    ${ADD_TASK_BUTTON}


*** Keywords ***
Open Minimal Todo App
    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP_PATH}
    ...    autoGrantPermissions=true
    ...    newCommandTimeout=120

Tap Add Todo
    Hide Keyboard
    Wait Until Page Contains Element    ${ADD_TASK_BUTTON}
    Click Element    ${ADD_TASK_BUTTON}
    Wait Until Page Contains Element    ${TITLE_FIELD}

Create Todo
    [Arguments]    ${title}
    Tap Add Todo
    Input Text    ${TITLE_FIELD}    ${title}
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains    ${title}

Open Todo By Title
    [Arguments]    ${title}
    ${todo_locator}=    Set Variable    xpath=//*[@text="${title}"]
    Wait Until Page Contains Element    ${todo_locator}
    Click Element    ${todo_locator}
    Wait Until Page Contains Element    ${TITLE_FIELD}
*** Settings ***
Documentation       Question 2: Login page automation for The Internet.
Library             SeleniumLibrary
Test Setup          Open Login Page
Test Teardown       Close Browser


*** Variables ***
${BASE_URL}                 http://the-internet.herokuapp.com/login
${BROWSER}                  Chrome
${VALID_USERNAME}           tomsmith
${VALID_PASSWORD}           SuperSecretPassword!
${INVALID_PASSWORD}         Password!
${UNKNOWN_USERNAME}         tomholland


*** Test Cases ***
Login Success
    [Documentation]    Verify users can log in successfully with a correct username and password.
    Page Should Contain Element    id=username
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains    You logged into a secure area!
    Page Should Contain Element    css=a.button.secondary.radius
    Click Link    Logout
    Wait Until Page Contains    You logged out of the secure area!
    Location Should Be    ${BASE_URL}

Login Failed - Password Incorrect
    [Documentation]    Verify login fails when username is correct but password is wrong.
    Page Should Contain Element    id=username
    Login With Credentials    ${VALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Page Contains    Your password is invalid!

Login Failed - Username Not Found
    [Documentation]    Verify login fails when username does not exist.
    Page Should Contain Element    id=username
    Login With Credentials    ${UNKNOWN_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Page Contains    Your username is invalid!


*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=username

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type="submit"]

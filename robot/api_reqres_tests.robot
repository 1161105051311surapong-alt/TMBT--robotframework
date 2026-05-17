*** Settings ***
Documentation       Question 3: REST API GET request tests for ReqRes.
Library             RequestsLibrary
Library             Collections


*** Variables ***
${BASE_URL}     https://reqres.in
${API_KEY}      free_user_3DWiw2SgAZmzdEuUhWpleq3OHFi
&{HEADERS}      x-api-key=${API_KEY}


*** Test Cases ***
Get User Profile Success
    [Documentation]    Verify existing user profile API returns status 200 and correct response data.
    API Key Should Be Configured
    Create Session    reqres    ${BASE_URL}    verify=${False}
    ${response}=    GET On Session    reqres    /api/users/12    headers=${HEADERS}    expected_status=200
    ${body}=    Set Variable    ${response.json()}
    ${data}=    Get From Dictionary    ${body}    data
    Should Be Equal As Integers    ${data}[id]    12
    Should Be Equal As Strings     ${data}[email]    rachel.howell@reqres.in
    Should Be Equal As Strings     ${data}[first_name]    Rachel
    Should Be Equal As Strings     ${data}[last_name]    Howell
    Should Be Equal As Strings     ${data}[avatar]    https://reqres.in/img/faces/12-image.jpg

Get User Profile But User Not Found
    [Documentation]    Verify not existing user profile API returns status 404 and empty response body.
    API Key Should Be Configured
    Create Session    reqres    ${BASE_URL}    verify=${False}
    ${response}=    GET On Session    reqres    /api/users/1234    headers=${HEADERS}    expected_status=404
    Should Be Equal As Strings    ${response.text}    {}


*** Keywords ***
API Key Should Be Configured
    Should Not Be Equal As Strings
    ...    ${API_KEY}
    ...    PUT_YOUR_REQRES_API_KEY_HERE
    ...    ReqRes now requires a valid x-api-key. Get a key from https://app.reqres.in/api-keys and run: robot -v API_KEY:<your_key> -d results/api robot/api_reqres_tests.robot

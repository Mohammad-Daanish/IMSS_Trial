*** Settings ***
#Suite Setup    Run Keywords    Setup Python Path
Library        SeleniumLibrary
Library        Collections
Library        String
Test Setup    open the browser with url
Library    DataDriver    file=Resources/data.csv    encoding=UTF-8    dialect=unix
Resource        ../Sample_Demos/Dummy_resource.robot
Test Template    Validate UnSuccessful Login
Test Teardown    Close browser session


*** Variables ***
${Error_Message_Xpath}=    xpath://div[@class='alert alert-danger col-md-12']


*** Test Cases ***
Login with user {username} and password  ${password}        abcd        12344

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct

Fill the login form
    [Arguments]    ${username}    ${password}
    Maximize Browser Window
    Input Text    id:username    ${username}
    Input Password    xpath://input[@type='password']    ${password}
    Sleep    2
    Click Button    id:signInBtn


wait until it checks and display error message
    Wait Until Element Is Visible        ${Error_Message_Xpath}

verify error message is correct
#    ${Error_Message}=    Get Text    ${Error_Message_Xpath}
#    Should Be Equal As Strings    ${Error_Message}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Xpath}        Incorrect username/password.

Configure Chrome Options
    [Arguments]    ${options}=${None}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    ${CHROME_OPTIONS}=    Set Variable    ${options}





    




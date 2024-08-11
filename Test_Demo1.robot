*** Settings ***
Library        SeleniumLibrary
Test Setup    open the browser with url
Test Teardown    Close browser session
Resource        PO/resource.robot


*** Variables ***
${user_Input}=    rahulshettyacademy
${Invalid_User_password}=    123456
${Error_Message_Xpath}=    xpath://div[@class='alert alert-danger col-md-12']


*** Test Cases ***

Validate UnSuccessful Login
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***

Fill the login form
    Maximize Browser Window
    Input Text    id:username    ${user_Input}
    Input Password    xpath://input[@type='password']    ${Invalid_User_password}
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible        ${Error_Message_Xpath}

verify error message is correct
#    ${Error_Message}=    Get Text    ${Error_Message_Xpath}
#    Should Be Equal As Strings    ${Error_Message}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Xpath}        Incorrect username/password.







    




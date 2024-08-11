*** Settings ***
Documentation    All the pages and objects and keywords of landing page
Library    SeleniumLibrary
Resource    PO/resource.robot


*** Variables ***
${Error_Message_Xpath}=    xpath://div[@class='alert alert-danger col-md-12']

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
#    Maximize Browser Window
    Input Text    id:username    ${username}
    Input Password    xpath://input[@type='password']    ${password}
    Click Button    id:signInBtn

wait until element is located in page
    wait untill element passed is locatoed on page    ${Error_Message_Xpath}

verify error message is correct
#    ${Error_Message}=    Get Text    ${Error_Message_Xpath}
#    Should Be Equal As Strings    ${Error_Message}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Xpath}        Incorrect username/password.


Fill the login details and form
    Sleep    2
    Input Text    id:username    rahulshettyacademy
    Input Password    xpath://input[@type='password']    learning
    Click Element    xpath:(//span[@class='checkmark'])[2]
    Wait Until Element Is Visible    css:.modal-content
    Click Element    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-content
    Select From List By Value    xpath://select[@class='form-control']    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
    Sleep    2
    Click Button    id:signInBtn

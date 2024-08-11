*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        String
Library        customLibraries/Shop.py
Test Setup    open the browser with url
#Test Teardown    Close browser session
Resource        resource.robot


*** Variables ***
${Error_Message_Xpath}=    xpath://div[@class='alert alert-danger col-md-12']
${ShopPage_load}=    css:.nav-link
${Checkout_Logo}=    //a[@class='nav-link btn btn-primary']
@{Listofproducts}=    Blackberry    Nokia Edge


*** Test Cases ***
#Validate UnSuccessful Login
#    Fill the login form    ${user_Input}        ${Invalid_password}
#    wait until element is located in page     ${Error_Message_Xpath}
#    verify error message is correct
Verify with valid credentials
    Sleep    2
    Fill the login form    ${user_Input}        ${valid_password}
    wait until element is located in page        ${ShopPage_load}
    Sleep    2
    verify card titles in the shop page
    select the specific card    Blackberry
##    Add Multiple Card For Checkout    ${Listofproducts}
#    add multiple card for checkout    ${Listofproducts}
    Sleep    3


#Fill the Registration form
#    Fill the login details and form

#Fill the emailId by grabbing from child window to main window
#    Select the link of child window
#    verify that user switched to child window
#    grab the emailId from the text
#    Switch to main window and paste the email Id


*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
#    Maximize Browser Window
    Input Text    id:username    ${username}
    Input Password    xpath://input[@type='password']    ${password}
    Click Button    id:signInBtn
wait until element is located in page
    [Arguments]        ${confirm_message}
    Wait Until Element Is Visible        ${confirm_message}


verify error message is correct
#    ${Error_Message}=    Get Text    ${Error_Message_Xpath}
#    Should Be Equal As Strings    ${Error_Message}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Xpath}        Incorrect username/password.

wait until checkout displayed
    Wait Until Element Is Visible    ${Checkout_Logo}
    
verify card titles in the shop page
    @{Expected_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List        ${actual_list}        ${element.text}
    END
    Lists Should Be Equal    ${Expected_list}        ${actual_list}

select the specific card
    [Arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If   '${cardName}' == '${element.text}'
        ${index}=     Evaluate    ${index} + 1
    END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button

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

Select the link of child window
    Click Link    xpath://a[contains(text(),'Free Access to InterviewQues/ResumeAssistance/Material')]
    Sleep    2
verify that user switched to child window
    Sleep    2
    Switch Window    NEW
    Element Text Should Be    xpath://h1[contains(text(),'Documents request')]    DOCUMENTS REQUEST
grab the emailId from the text
    ${text}=    Get Text    xpath://p[@class="im-para red"]
    @{child_window_text}=    Split String    ${text}    at
    #0-->Please email us at
    #1-->mentor@rahulshettyacademy.com with below template to receive response
    ${Split_text}=  Get From List    ${child_window_text}    1
    @{child_window_text_2}=    Split String    ${Split_text}
    #0-->mentor@rahulshettyacademy.com
    #1-->with below template to receive response
    ${email}=  Get From List    ${child_window_text_2}    0
    Set Global Variable    ${email}

Switch to main window and paste the email Id
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}






    
      












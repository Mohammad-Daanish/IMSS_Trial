*** Settings ***
Documentation    All the pages and objects and keywords of shopping page
Library    SeleniumLibrary


*** Variables ***
${ShopPage_load}=    css:.nav-link

*** Keywords ***

wait until element is located in page
    wait untill element passed is locatoed on page    ${ShopPage_load}

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
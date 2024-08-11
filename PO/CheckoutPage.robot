*** Settings ***
Documentation    All the pages and objects and keywords of landing page
Library    SeleniumLibrary

*** Variables ***
${Checkout_Logo}=    //a[@class='nav-link btn btn-primary']
${Checkout_Button}=    xpath://li/a[@class='nav-link btn btn-primary']
${Product_selected}=    xpath://h4/a[text()='Blackberry']
${confirm_checkout_Button}=    //td/button[contains(text(),'Checkout ')]


*** Keywords ***

wait until checkout displayed
    Wait Until Element Is Visible    ${Checkout_Logo}

Click On Checkout Button
    Click Element    ${Checkout_Button}
    Sleep    2

Verify If Checkout page contains product
    Element Text Should Be    ${Product_selected}        Blackberry

Confirm and Click On Checkout Button
    Click Button    ${confirm_checkout_Button}


Enter country name
    [Arguments]    ${country_name}
    Input Text    id:country    ${country_name}
    Sleep    4
    Wait Until Element Is Visible    xpath://li/a[contains(text(),'${country_name}')]
    Click Element    xpath://li/a[contains(text(),'${country_name}')]
    Click Element    xpath://div/label[contains(text(),'I agree with the')]
    Click Button    xpath://input[@type='submit']
    Page Should Contain    Success!


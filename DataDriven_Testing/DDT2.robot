*** Settings ***
Library        SeleniumLibrary
Resource    ../DataDriven_Testing/login_resources.robot
Library    DataDriver    file=../Test_Data/loginData.xlsx    encoding=UTF-8    dialect=unix
Suite Setup    Open Login Page
Suite Teardown    Close Browsers
Test Template    Invalid Login
#Test Template    Valid Login


*** Test Cases ***
LoginTestwithExcel using ${username} and ${password}

*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Pwd    ${password}
    Click Login Button
    Error Message should be visible

Valid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Pwd    ${password}
    Click Login Button
    User logged in successfully
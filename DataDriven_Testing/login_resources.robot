*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${LOGIN_URL}=    https://demo.nopcommerce.com/login?returnUrl=%2F
${BROWSER}=    chrome

*** Keywords ***
open the browser with url
    Create Webdriver    chrome  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${LOGIN_URL}
    Maximize Browser Window

Close Browsers
    Close All Browsers

Open Login Page
    Create Webdriver    chrome  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${LOGIN_URL}
    Maximize Browser Window

Input username
    [Arguments]    ${username}
    Input Text    id:Email    ${username}
    
Input Pwd
    [Arguments]    ${password}
    Input Password    id:Password    ${password}

click Login Button
    Click Element    xpath://div/button[text()='Log in']

click logout link
    Click Element    xpath://li/a[text()='Log out']

Error Message should be visible
    Page Should Contain    Login was unsuccessful.

User logged in successfully
    Page Should Contain    Welcome to our store


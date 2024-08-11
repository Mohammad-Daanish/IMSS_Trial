*** Settings ***
Library        SeleniumLibrary
Variables    C:/Users/mohammad.daanish/PycharmProjects/pythonProject1/Robot_Framework_2024/Sample_Demos/PO/Loctors.py

*** Variables ***
${url}=    https://demo.guru99.com/test/newtours/
*** Keywords ***

open the browser
    Create Webdriver    Chrome  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${url}
    Maximize Browser Window

Enter username
    [Arguments]    ${username}
    Input Text    ${txt_login_username}    ${username}

Enter password
    [Arguments]    ${password}
    Input Password    ${txt_login_password}    ${password}
    
Click submit button
    Click Button    ${txt_login_signInButton}

Close my browser
    Close All Browsers
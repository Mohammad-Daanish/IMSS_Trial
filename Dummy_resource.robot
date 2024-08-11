*** Settings ***
Documentation    A resource file with reusable keywords and  variables.

Library    SeleniumLibrary

*** Variables ***
${user_Input}=    rahulshettyacademy
${Invalid_password}=        12345678
${valid_password}=    learning
${url}=    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with url
    Create Webdriver    Chrome  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${url}

Close browser session
    Close Browser



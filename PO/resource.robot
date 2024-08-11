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

open the browser
    [Arguments]    ${browser_name}
    Create Webdriver    ${browser_name}  executable_path=Robot_Framework_2024/Sample_Demos/Resources/${browser_name}
    Go To    ${url}


Close browser session
    Close Browser

wait untill element passed is locatoed on page
    [Arguments]    ${page_locartor}
    Wait Until Element Is Visible    ${page_locartor}


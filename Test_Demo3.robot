*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        String
Test Setup    open the browser with url
Test Teardown    Close Browser

*** Variables ***
${browser}=    Chrome
${url}=    https://demo.nopcommerce.com/
${valid_username}=    daanishrehan@gmail.com
${valid_password}=    Spartans@786

*** Test Cases ***
Fill the registration form
    Fill your personal details

LoginTest Commerce website
    open the browser with url
    login to Application

*** Keywords ***
open the browser with url
    Create Webdriver    ${browser}  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${url}

Fill your personal details
    Maximize Browser Window
    Sleep    2
    Wait Until Element Is Visible    xpath://li/a[text()='Register']
    Click Link    xpath://li/a[text()='Register']
    Sleep    2
    Click Element    id:gender-male
    Input Text    xpath://div/input[@name='FirstName']    Daanish
    Input Text    xpath://div/input[@name='LastName']    Rehan
    Sleep    2
    Select From List By Value    xpath://select[@name='DateOfBirthDay']    14
    Sleep    2
    Select From List By Value    xpath://select[@name='DateOfBirthMonth']    2
    Select From List By Value    xpath://select[@name='DateOfBirthYear']    1998
    Sleep    3
    Input Text    xpath://input[@id='Email']    daanishrehan@gmail.com
    Input Text    id:Company    XYZ
    Input Password    id:Password    Spartans@786
    Input Password    id:ConfirmPassword    Spartans@786
    Click Button    id:register-button
    Set Global Variable    ${valid_username}
    Set Global Variable    ${valid_password}

login to Application
    Click Link    css:.ico-login
    Sleep    2
    Input Text    xpath:(//input[@type='email'])[1]    ${valid_username}
    Input Password    id:Password    ${valid_password}
    Click Button    xpath:(//button[@type='submit'])[2]
    Sleep    2
    Close Browser





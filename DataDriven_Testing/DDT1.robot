*** Settings ***
Library        SeleniumLibrary
Resource    ../DataDriven_Testing/login_resources.robot
Suite Setup    open the browser with url
Suite Teardown    Close Browsers
Test Template    Invalid Login
Test Template    Valid Login


*** Test Cases ***        ${username}                            ${password}
Right user empty pswd    daanishrehan@gmail.com            ${EMPTY}
Right user wrong pswd    daanishrehan@gmail.com            xyz
wrong user right pswd    daanishrehan@gmail                Spartans@786
wrong user empty pswd    Baanijishrehan@gmail              ${EMPTY}
wrong user wrong pswd    Baanijishrehan@gmail              xyz
Right user Right pswd    daanishrehan@gmail.com            Spartans@786

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
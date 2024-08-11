*** Settings ***
Library        SeleniumLibrary
Resource    C:/Users/mohammad.daanish/PycharmProjects/pythonProject1/Robot_Framework_2024/Sample_Demos/Resources/Loginkeywords.robot


*** Variables ***
${Browser}=    chrome
${url}=    https://demo.guru99.com/test/newtours/
${user}=    tutorial
${pwd}=    tutorial


*** Test Cases ***
Login Test
    Open The Browser
    Enter Username    ${user}
    Enter password    ${pwd}
    Click Submit Button
    Sleep    3
    Close my browser
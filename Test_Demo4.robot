*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        String
Test Setup    open the browser with url
Test Teardown    Close Browser

*** Variables ***
${browser}=    Chrome
#${url}=    https://demo.nopcommerce.com/
${url}=    https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php
${url_2}=    https://demowebshop.tricentis.com/login
${url_3}=    https://testautomationpractice.blogspot.com/
${url_4}=    https://demo.opencart.com/
${url_5}=    http://swisnl.github.io/jQuery-contextMenu/demo.html
${url_6}=    https://testautomationpractice.blogspot.com/
${url_7}=    http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
${scrollpage_url}=    https://www.countries-ofthe-world.com/capitals-of-the-world.html
${TableValidation_url}=    https://testautomationpractice.blogspot.com/

*** Test Cases ***
#Testing Input Box
#    open the browser with url
#    Input Text Box Features

Testing All Common methods
#    Testing Radio Buttons and checkboxes
#    Handling drop-downs and lists
#    waits and Timeouts in Selenium
#    Handling Alerts
#    Handling Frames
#    Browser related Keywords
#    Capture screenshots
#    Mouse Actions
    Scroll-page Test
#    GrabAllLinks
#    Tablevalidation

*** Keywords ***
open the browser with url
    Create Webdriver    ${browser}  executable_path=C:/Users/mohammad.daanish/AppData/Local/Programs/Python/Python310/chromedriver_win32/chromedriver-win32/chromedriver-win32/chromedriver.exe
    Go To    ${scrollpage_url}

Input Text Box Features
    Maximize Browser Window
    Sleep    2
    Title Should Be    nopCommerce demo store
    Click Link    css:.ico-login
    ${"email_text"}=    Set Variable    xpath://label[text()='Email:']
    ${"email_Text_Box}=    Set Variable    xpath://input[@type='email']
    Log    ${"email_text"}
    Element Should Be Visible    ${"email_text"}
    Element Should Be Enabled    ${"email_text"}
    Input Text    ${"email_Text_Box}    daanishrehan@gmail.com
    Clear Element Text    ${"email_Text_Box}
    Sleep    2
    Close Browser
  
Testing Radio Buttons and checkboxes
    
    Select Radio Button    gender    Male
     Select Radio Button    sex    Female
# Only Applicable when you have both name and value exsist in your code.

    # Selecting CheckBoxes
    Select Checkbox    dob
    Sleep    3
    Unselect Checkbox    xpath:(//div/input[@type='checkbox'])[3]
    Sleep    2

Handling drop-downs and lists
    Select From List By Value    id:state    Uttar Pradesh
    Select From List By Label    id:state    NCR
    Select From List By Index    xpath://select[@name='state']    3

waits and Timeouts in Selenium
#    Open Browser    https://demowebshop.tricentis.com/login    chrome
    ${time_slot}=    Get Selenium Speed
    Log    ${time_slot}
    Maximize Browser Window
#    Set Selenium Speed    2
    Set Selenium Timeout    10
    Click Link    xpath://li/a[text()='Register']
    Wait Until Element Contains    xpath://h1[text()='Register']    Register
    Select Radio Button    Gender    M
    Input Text    id:FirstName    Mohammad
    Input Text    id:LastName    Daanish
    Input Text    id:Email    daanishrehan@gmail.com
    Input Text    xpath:(//input[@type='password'])[1]    123456
    Input Text    xpath:(//input[@type='password'])[2]    123456
    ${time_slot}=    Get Selenium Speed
    Log    ${time_slot}

Handling Alerts
#    Click Element    xpath://button[text()='Alert']
#    Click Element    xpath:(//div/div[@class='widget-content'])[4]
#    Handle Alert    accept
#    Click Element    xpath://button[text()='Confirm Box']
#    Handle Alert    accept
#    Handle Alert    dismiss
#    Handle Alert    leave
#    Sleep    2
    Click Element    xpath://button[text()='Prompt']
#    Input Text    id:demo    Daanish Rehan
#    Sleep    2
#    Handle Alert    accept
    Sleep    3
#    Alert Should Be Present    Please enter your name:
    Input Text Into Alert    Daanish    accept
    Sleep    4

Handling Frames
#    Click Element    xpath://button[text()='New Browser Window']
#    Sleep    3
#    select window    title=
#    Switch Browser    1
##    Element Text Should Be    xpath:(//img[contains(@class,'img-fluid')])[1]   Your Store
##    Element Should Be Visible    xpath://a[text()='Desktops']    Desktops
#    ${title_1}=    Get Title
#    Log To Console    ${title_1}
    ${title_2}=    Get Title
    Log    ${title_2}
    
Browser related Keywords
#    open the browser with url
    ${loc}=    Get Location
    Log To Console  ${loc}

    Go To    https://www.bing.com/
    ${loc}=    Get Location
    Log To Console  ${loc}
    
    Go Back
    ${loc}=    Get Location
    Log To Console  ${loc}

     
Capture screenshots
    Click Link    //a[text()='Log in']
    Maximize Browser Window
    Input Text    id:Email    daanishrehan@gmail.com
    Input Password    id:Password    Spartans
    Capture Element Screenshot    xpath://img[contains(@alt,'Tricentis Demo Web Shop')]    C:/Users/mohammad.daanish/PycharmProjects/pythonProject1/Robot_Framework_2024/Sample_Demos/logo.png
    Capture Page Screenshot    C:/Users/mohammad.daanish/PycharmProjects/pythonProject1/Robot_Framework_2024/Sample_Demos/Capture_screenshots.png

Mouse Actions
    Right click / Open Context menu
    Maximize Browser Window
    Sleep    2
    Open Context Menu    xpath://span[text()='right click me']
    Sleep    3
    Click Element    xpath://li/span[contains(text(),'Copy')]

     Double Click Button
    Go To    ${url_6}
    Double Click Element    xpath://button[text()='Copy Text']
    Sleep    3

     Drag and Drop
    Go To    ${url_7}
    Drag And Drop    id:box6    id:box106
    Sleep    3

Scroll-page Test
    Maximize Browser Window
    Sleep    10
    Execute Javascript    window.scrollTo(0,2500)
    Scroll Element Into View    xpath://*[contains(text(),'India')]
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Sleep    2
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)
    Sleep    2

GrabAllLinks
    Maximize Browser Window
    ${AllLinkcounts}=    Get Element Count    xpath://a
    Log To Console    ${AllLinkcounts}
    
    @{LinkItems}    Create List    
    FOR    ${i}    IN RANGE    1    ${AllLinkcounts}
        ${linkItems}=    Get Text    xpath://a
        Log To Console    ${linkText}
        Log    ${linkText}
    END

Tablevalidation
    Maximize Browser Window
    Scroll Element Into View    xpath:(//table/tbody/tr)[5]
    Sleep    3
    ${rows}=    Get Element Count    xpath://table[@name='BookTable']/tbody/tr
    ${cols}=    Get Element Count    xpath://table[@name='BookTable']/tbody/tr[1]/th

    Log To Console    ${rows}
    Log To Console    ${cols}
    
    ${data}=    Get Text    xpath://table[@name='BookTable']/tbody/tr[3]/td[1]
    Log To Console    ${data}

    Table Column Should Contain    xpath://table[@name='BookTable']    2    Author
    Table Row Should Contain    xpath://table[@name='BookTable']    5    Master In Selenium
    Table Cell Should Contain   xpath://table[@name='BookTable']    5    2    Mukesh
    Table Header Should Contain    xpath://table[@name='BookTable']    BookName
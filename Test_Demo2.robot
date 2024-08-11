*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        String
#Resource    customLibraries/Shop.py
Test Setup    open the browser with url
#Test Teardown    Close browser session
Resource        PO/resource.robot
Resource    PO/LandingPage.robot
Resource    PO/ShoppingPage.robot
Resource    PO/CheckoutPage.robot


*** Variables ***

@{Listofproducts}=    Blackberry    Nokia Edge
${country_name}=    Indonesia

*** Test Cases ***
Validate UnSuccessful Login
    LandingPage.Fill the login form    ${user_Input}        ${Invalid_password}
    LandingPage.wait until element is located in page
    LandingPage.verify error message is correct


Verify with valid credentials
    Sleep    2
    LandingPage.Fill the login form    ${user_Input}        ${valid_password}
    ShoppingPage.wait until element is located in page
    Sleep    2
    ShoppingPage.verify card titles in the shop page
    ShoppingPage.select the specific card    Blackberry
    CheckoutPage.Click On Checkout Button
##    add multiple card for checkout    ${Listofproducts}
#    Sleep    3
    CheckoutPage.Verify If Checkout page contains product
    CheckoutPage.Confirm and Click On Checkout Button
    CheckoutPage.Enter country name    ${country_name}


Fill the Registration form
    LandingPage.Fill the login details and form

#Fill the emailId by grabbing from child window to main window
#    ShoppingPage.Select the link of child window
#    ShoppingPage.verify that user switched to child window
#    ShoppingPage.grab the emailId from the text
#    ShoppingPage.Switch to main window and paste the email Id


*** Keywords ***










    
      












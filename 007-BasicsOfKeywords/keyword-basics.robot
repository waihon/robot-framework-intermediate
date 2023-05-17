*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check invoice manager page
    Comment    We've learned how to create a custom keyword!
    Navigate to Homepage
    Wait Until Page Contains    Invoice Manager

*** Keywords ***
Navigate to Homepage
    Open Browser  http://inv.beaufortfairmont.com/   chrome

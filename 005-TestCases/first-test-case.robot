*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check invoice manager page
    Open Browser    http://inv.beaufortfairmont.com/    chrome
    Comment    Checking that we're on the Invoice Manager page
    Wait Until Page Contains    Invoice Manager  timeout=5

*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Create an Invoice
    Comment    This is my first RobotFramework test case!
    Open Browser    http://inv.beaufortfairmont.com/    chrome
    Sleep  3
    Close Browser

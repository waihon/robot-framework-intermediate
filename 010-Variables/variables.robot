*** Settings ***
Library  SeleniumLibrary
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser

*** Variables ***
${SITE_URL}  http://inv.beaufortfairmont.com
${BROWSER}   Chrome

*** Test Cases ***
Using Variables
  Comment    This test should use variables for the url and the browser.

*** Keywords ***
Navigate To Home Page
    Open Browser  ${SITE_URL}  ${BROWSER}

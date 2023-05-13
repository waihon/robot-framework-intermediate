*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    #click the add invoice button

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}

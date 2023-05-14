*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Link  Add Invoice
    Page Should Contain    Invoice Manager
    Page Should Contain Element    invoiceNo_add
    Page Should Contain Button    Create

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

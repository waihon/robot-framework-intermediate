*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Link  Add Invoice
    Wait Until Page Contains    Invoice Manager
    Page Should Contain Element    invoiceNo_add
    Page Should Contain Button    Create

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    # Slow execution down
    Maximize Browser Window
    Set Selenium Speed    1 Second

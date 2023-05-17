*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    Input Text    invoice    123456789
    Input Text    company    Acme Corporation
    Input Text    type       Test automation
    Input Text    price      1234.56
    Input Text    dueDate    2023-05-15
    Input Text    comment    Web UI test automation

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5 Seconds


Click Add Invoice
    Click Link  Add Invoice
    Wait Until Page Contains Element     invoiceNo_add

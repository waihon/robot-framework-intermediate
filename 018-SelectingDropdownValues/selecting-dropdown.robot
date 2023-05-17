*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    Input Text  invoice   my example invoice
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Select From List By Value    selectStatus  Past Due
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged drain

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5 Seconds


Click Add Invoice
    Click Link  Add Invoice
    Wait Until Page Contains Element     invoiceNo_add

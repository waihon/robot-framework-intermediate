*** Settings ***
Library  SeleniumLibrary
Library  String
Library  DateTime

Resource  resources.robot
Suite Setup  Run Keywords   Set Suite Variables  Navigate To Home Page
Suite Teardown  Run Keywords    Delete Invoice If Exists  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    ${invoiceNumber}=    Create Invoice Number
    Set Suite Variable   ${invoiceNumber}
    Input Text  invoice   ${invoiceNumber}
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Select From List By Value   selectStatus    Past Due
    Click Button    createButton
    Wait Until Page Contains     ${invoiceNumber}
    Capture Page

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds


Click Add Invoice
    Click Link  Add Invoice
    Wait Until Page Contains Element     invoiceNo_add
    Capture Element  invoiceNo_add

Delete Invoice
    [Arguments]  ${invoice_element}
    Click Link  ${invoice_element}
    Click Button    deleteButton

Delete Invoice If Exists
    ${invoice_count}=   Get Element Count    css:[id^='invoiceNo_${invoiceNumber}'] > a
    Run Keyword If      ${invoice_count} > 0    Delete Invoice  css:[id^='invoiceNo_${invoiceNumber}'] > a

Create Invoice Number
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Set Suite Variables
    ${current_date}=  Get Current Date  result_format=%Y-%m-%d
    Set Suite Variable  ${current_date}

Capture Page
    Capture Page Screenshot  filename=selenium-screenshot-${current_date}-{index}.png

Capture Element
    [Arguments]  ${element}
    Capture Element Screenshot  ${element}  filename=selenium-element-screenshot-${current_date}-{index}.png

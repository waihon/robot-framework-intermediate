*** Settings ***
Library  SeleniumLibrary
Library  String

Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Run Keywords  Delete Invoice  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    ${invoiceNumber}=   Create Invoice Number
    Set Suite Variable  ${invoiceNumber}
    Input Text  invoice   ${invoiceNumber}
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Select From List By Value   selectStatus    Past Due
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Click Button    createButton
    Wait Until Page Contains  ${invoiceNumber}  timeout=5

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

Click Add Invoice
    Click Link  Add Invoice
    Wait Until Page Contains Element     invoiceNo_add

Create Invoice Number
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Delete Invoice
    Click Link  ${invoiceNumber}
    Click Button  Delete Invoice
    Wait Until Page Does Not Contain    ${invoiceNumber}  timeout=5

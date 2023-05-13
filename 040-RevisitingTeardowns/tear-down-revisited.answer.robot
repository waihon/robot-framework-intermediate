*** Settings ***
Library  SeleniumLibrary
Library  String

Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Run Keywords    Delete Invoice  Close Browser

*** Test Cases ***
Create an Invoice
    Click Add Invoice
    ${randomstring}=  Create Invoice Number
    Set Suite Variable   ${invoiceNumber}   ${randomString}
    Input Text  invoice   ${invoiceNumber}
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Select From List By Value   selectStatus    Past Due
    Click Button    createButton
    Page Should Contain     ${invoiceNumber}

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

Click Add Invoice
    Click Link  Add Invoice
    Page Should Contain Element     invoiceNo_add

Create Invoice Number
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Delete Invoice
    Click Link  css:[id^='invoiceNo_${invoiceNumber}'] > a
    Click Button    deleteButton

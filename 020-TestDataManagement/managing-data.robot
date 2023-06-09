*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    ${invoice_number}=  Generate Invoice Number
    Input Text  invoice   ${invoice_number}
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Select From List By Value   selectStatus    Past Due
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Click Element    createButton
    
*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

Click Add Invoice
    Click Link  Add Invoice
    Page Should Contain Element     invoiceNo_add

Generate Invoice Number
    ${invoice_number}=  Generate Random String  10  [LETTERS]
    [Return]  ${invoice_number}

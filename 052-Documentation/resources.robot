*** Settings ***
Library    SeleniumLibrary
Library    String
Library    RequestsLibrary

# To generate HTML documenttion for keywords:
# python -m robot.libdoc --format HTML ./resources.robot ./resources.html

*** Variables ***
${SiteUrl}    http://inv.beaufortfairmont.com
${Browser}     Chrome
${ApiUrl}     http://inv.beaufortfairmont.com:8082

*** Keywords ***
Navigate To Home Page
    [Documentation]  Navigate to the Home page.
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds
    
Click Add Invoice
    [Documentation]  Click Add Invoice link assuming it's on the Home page.
    Click Link    Add Invoice
    Wait Until Page Contains Element     invoiceNo_add

Confirm Invoice Exists
    [Documentation]  Using the API, return true if suite variable invoiceId is found in invoices, false otherwise.
    ${resp}=  Get Invoice Response
    Should Be Equal As Strings	${resp.status_code}	200
    [RETURN]  Dictionary Should Contain Value	${resp.json()}	${invoiceId}

Get Invoice Response
    [Documentation]  Using the API, return the response of getting invoices by suite variable
    ...    invoicdId.
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Get On Session    invoice-manager    /invoices/${invoiceId}  expected_status=any
    [RETURN]  ${resp}

Delete Invoice
    [Documentation]  Using the API, delete an invoice by argument invoiceToDelete and return
    ...    true if OK, false otherwise.
    [Arguments]  ${invoiceToDelete}
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Delete On Session    invoice-manager    /invoices/${invoiceToDelete}
    Should Be Equal As Strings	${resp.status_code}	200

Delete Invoice If Exists
    [Documentation]  Using the API, check to see if invoice with id suite variable invoiceId
    ...    exists, and if so, delete it.
    ${response}=  Get Invoice Response
    Run Keyword If      ${response.status_code} == 200    Delete Invoice  ${invoiceId}

Create Invoice Number
    [Documentation]  Return a random string consisting of 10 lowercase and/or uppercase
    ...    characters.
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Setup Invoice Number
    [Documentation]  Set a random invoice id as  suite variable invoicId.
    ${invoiceId}=    Create Invoice Number
    Set Suite Variable   ${invoiceId}
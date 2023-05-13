*** Settings ***
Library    RequestsLibrary

*** Variables ***
${SiteUrl}    http://inv.beaufortfairmont.com
${Browser}     Chrome
${ApiUrl}     http://inv.beaufortfairmont.com:8082

*** Keywords ***
Navigate To Home Page
    [Documentation]  This keyword mainly for starting tests, will open the browser 
    ...  and got to the apps main page.
    Open Browser    ${SiteUrl}		${Browser}
    ${invoiceId}=    Create Invoice Number
    Set Suite Variable   ${invoiceId}
    Set Selenium Speed    0.5 Seconds
    
Click Add Invoice
    [Documentation]  Clicks the add invoice button, assuming its on the main page.
    Click Link    Add Invoice
    Page Should Contain Element     invoiceNo_add

Confirm Invoice Exists
    [Documentation]  Using the API, this keyword checks if invoice with id suite 
    ...  variable invoiceId exists.
    ${resp}=  Get Invoice Response
    Should Be Equal As Strings	${resp.status_code}	200
    [RETURN]  Dictionary Should Contain Value	${resp.json()}	${invoiceId}

Get Invoice Response
    [Documentation]  Using the API, gets invoice with id suite variable invoiceId.
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Get On Session    invoice-manager    /invoices/${invoiceId}  expected_status=any
    [RETURN]  ${resp}

Delete Invoice
    [Arguments]  ${invoiceToDelete}
    [Documentation]  Using the API, deletes invoiceToDelete.
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Delete On Session    invoice-manager    /invoices/${invoiceToDelete}
    Should Be Equal As Strings	${resp.status_code}	200

Delete Invoice If Exists
    [Documentation]  Using the API, checks to see if invoice with id suite variable 
    ...  invoiceId exists, and if so, deletes it.
    ${responseCode}=  Get Invoice Response
    Run Keyword If      ${responseCode.status_code} == 200    Delete Invoice  ${invoiceId}

Create Invoice Number
    [Documentation]  Generates a random string of 10 letters to be used as invoiceId.
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Setup Invoice Number
    ${invoiceId}=    Create Invoice Number
    Set Suite Variable   ${invoiceId}
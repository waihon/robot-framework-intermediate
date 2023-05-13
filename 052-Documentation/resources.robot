*** Settings ***
Library    RequestsLibrary

*** Variables ***
${SiteUrl}    http://inv.beaufortfairmont.com
${Browser}     Chrome
${ApiUrl}     http://inv.beaufortfairmont.com:8082

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds
    
Click Add Invoice
    Click Link    Add Invoice
    Page Should Contain Element     invoiceNo_add

Confirm Invoice Exists
    ${resp}=  Get Invoice Response
    Should Be Equal As Strings	${resp.status_code}	200
    [RETURN]  Dictionary Should Contain Value	${resp.json()}	${invoiceId}

Get Invoice Response
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Get On Session    invoice-manager    /invoices/${invoiceId}  expected_status=any
    [RETURN]  ${resp}

Delete Invoice
    [Arguments]  ${invoiceToDelete}
    Create Session	invoice-manager     ${ApiUrl}
    ${resp}=  Delete On Session    invoice-manager    /invoices/${invoiceToDelete}
    Should Be Equal As Strings	${resp.status_code}	200

Delete Invoice If Exists
    ${responseCode}=  Get Invoice Response
    Run Keyword If      ${responseCode.status_code} == 200    Delete Invoice  ${invoiceId}

Create Invoice Number
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

Setup Invoice Number
    ${invoiceId}=    Create Invoice Number
    Set Suite Variable   ${invoiceId}
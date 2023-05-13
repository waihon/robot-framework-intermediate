*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  String
Library  Collections

Resource  resources.robot
Suite Setup  Run Keywords   Setup Invoice Number  Navigate To Home Page  Delete Invoice If Exists
Suite Teardown  Run Keywords    Close Browser  Delete Invoice If Exists

*** Test Cases ***
Create an Invoice
    Click Add Invoice
    Input Text  invoice   ${invoiceId}
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Select From List By Value   selectStatus    Past Due
    Click Button    createButton
    Confirm Invoice Exists


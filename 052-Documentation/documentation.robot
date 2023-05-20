*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  String
Library  Collections

# To generate HTML documentation for test cases:
# python -m robot.testdoc ./documentation.robot ./documentation.html

Resource  resources.robot
Suite Setup  Run Keywords   Setup Invoice Number  Navigate To Home Page  Delete Invoice If Exists
Suite Teardown  Run Keywords    Close Browser  Delete Invoice If Exists

*** Test Cases ***
Create an Invoice
    [Documentation]  Validates a new invoice with id suite variable invoiceId is created
    ...   successfully via Add Invoice page.
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


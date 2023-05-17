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
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    # Find a similar but alternative method for selecting "Past Due" as the status
    #Select From List By Value   selectStatus    Past Due
    Select From List By Label  selectStatus    Past Due
    # Find an alternative method for clicking the Create button
    #Click Button    createButton
    #Click Button    Create
    Click Element   createButton

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds


Click Add Invoice
    # Find an alternative method for navigating to the Add Invoice page
    #Click Link  Add Invoice
    Click Element  //*[@id='sidebar-wrapper']/ul/li[4]/a
    Page Should Contain Element     invoiceNo_add

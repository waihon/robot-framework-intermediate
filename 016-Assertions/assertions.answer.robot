*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Link  Add Invoice
    Page Should Contain Element     invoiceNo_add

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    #slow execution down if you want to see it runnning with the following:
    Set Selenium Speed    1 Seconds

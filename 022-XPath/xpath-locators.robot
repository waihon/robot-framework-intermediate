*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Test Setup  Navigate To Home Page
Test Teardown  Close Browser

*** Test Cases ***
Click Add Invoice with XPath
    Click Link  xpath://*[@id="sidebar-wrapper"]/ul/li[4]/a
    Page Should Contain Element     invoiceNo_add

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    1 Second

*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Test Setup  Navigate To Home Page
Test Teardown  Close Browser

*** Test Cases ***
Click Add Invoice using Relative XPath
    Click Link  xpath://div[@id='sidebar-wrapper']//li[4]/a
    Page Should Contain Element     invoiceNo_add

Click Add Invoice using Relative XPath or "XPath" from Chrome Dev Tools
    Click Link  xpath://*[@id="sidebar-wrapper"]/ul/li[4]/a
    Page Should Contain Element     invoiceNo_add

Click Add Invoice using Absolute XPath or "full XPath" from Chrome Dev Tools
    Click Link  xpath:/html/body/div/div[1]/ul/li[4]/a
    Page Should Contain Element     invoiceNo_add


Extra Credit: Click On First Invoice using Absolute XPath or "full XPath" from Chrome Dev Tools
    Sleep  2secs
    Click Link    xpath:/html/body/div/div[2]/div/div[2]/div/div/rd-widget/div/rd-widget-body/div/div/div/table/tbody/tr[2]/td[1]/a
    Page Should Contain Element    deleteButton

Extra Credit: Click On First Invoice using Relative "Milestone" XPath
    Sleep  2secs
    Click Link    xpath://*[@id='content-wrapper']//table/tbody/tr[@ng-repeat][1]/td[1]/a
    Page Should Contain Element    deleteButton

# Here are two more valid methods for clicking the first invoice. Note though
# they "hard code" the invoice id which at the time of the execution may no
# longer be valid.

# Extra Credit: Click On First Invoice using Known Invoice Number
#     Sleep  2secs
#     Click Link    xpath://*[@id="invoiceNo_1112923"]/a
#     Page Should Contain Element    deleteButton

# Extra Credit: Click On First Invoice using Relative XPath or "XPath" from Chrome Dev Tools
#     Sleep  2secs
#     Click Link    xpath://*[@id="invoiceNo_1112923"]/a
#     Page Should Contain Element    deleteButton


*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.75 Seconds


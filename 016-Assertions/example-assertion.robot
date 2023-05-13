*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Link  Add Invoice
    # found this keyword to assert (verify) the button is on the page from the SeleniumLibrary documentation page
    Page Should Contain Button  Create 


*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    #slow execution down if you want to see it runnning with the following:
    Set Selenium Speed    1 Seconds

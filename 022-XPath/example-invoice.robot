*** Settings ***
Library  SeleniumLibrary
Resource  resources.robot
Test Setup  Navigate To Home Page
Test Teardown  Close Browser

*** Test Cases ***
Click on Notification Bell Using XPath
    # Using "full XPath" or Absolute XPath from Chrome Dev Tools
    Click Element  xpath:/html/body/div/div[2]/div/div[1]/div/div[1]/div[2]/a

    # Using "XPath" or Relative XPath from Chrome Dev Tools
    Click Element  xpath://*[@id="content-wrapper"]/div/div[1]/div/div[1]/div[2]/a

    # As the relative XPath starts with a double forward slash, '//' we can
    # use the default locator strategy
    Click Element  //*[@id="content-wrapper"]/div/div[1]/div/div[1]/div[2]/a


*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

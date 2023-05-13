*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Examples of XPath
   Open Browser  file:///${CURDIR}/../012-IntroductionToHTML/example.html  Chrome

   # Using "full XPath" or Absolute XPath from Chrome Dev Tools
   Element Should Contain    xpath:/html/body/p[2]
   ...  This element has an attribute 'id' whose value is 'some_text'

   # Using "XPath" or Relative XPath from Chrome Dev Tools
   Element Should Contain    xpath://*[@id="some_text"]
   ...  This element has an attribute 'id' whose value is 'some_text'
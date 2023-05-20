*** Settings ***

*** Test Cases ***
My Test Case
  My Log  Hello, world!


*** Keywords ***
My Log
    [Arguments]  ${text}
    Log to Console   This is the message:  ${text}

   
*** Settings ***

*** Test Cases ***
My Test Case
    My Log  Hello, world!


*** Keywords ***
My Log
    [Arguments]  ${message}
    Log To Console    This is the message: ${message}
   
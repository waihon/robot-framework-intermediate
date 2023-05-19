*** Settings ***

Library  BuiltIn

*** Test Cases ***
Catenate Strings
    # By default, catenate places a space between the two strings
    ${result}  Catenate  foo    bar
    Should be equal as strings  foo bar  ${result}

Catenate Strings without spaces
    ${result}  Catenate  SEPARATOR=  foo    bar
    Should be equal as strings  foobar  ${result}

Catenate String literal and variable
    ${string1}  Set variable  foo
    ${result}  Catenate  SEPARATOR=  ${string1}    bar
    Should be equal as strings  foobar  ${result}

Catenate String literal and variable without catenate keyword
    ${string1}  Set variable  foo
    ${result}  Set variable  ${string1}bar
    Should be equal as strings  foobar  ${result}

Catenate String literal and variable inline in parameter
    ${string1}  Set variable  foo
    Log to Console  ${string1}bar

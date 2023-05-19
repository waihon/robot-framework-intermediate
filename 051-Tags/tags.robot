*** Settings ***
Force Tags  Functional      # All tests unconditionally get this tag
Default Tags  Invoice Team  # All tests which haven't got any tag get this tag

# To include certain tags:
# - robot --include tag1 --include tag2 ... --include tagN tags.robot
# - robot -i tag1 -i tag2 ... -i tagN tags.robot
# To exclude certain tags:
# - robot --exclude tag1 --exclude tag2 ... --exclude tagN tags.robot
# - robot -e tag1 -e tag2 ... -e tagN tags.robot
# If a tag has space in between, we'll have to use quotes to enclose the tag
# Examples:
# - Only the smoke tests:                 robot -i smoke tags.robot
# - Only the regression tests:            robot -i regression tags.robot
# - Only known issue #27:                 robot -i KnownIssue-27 tags.robot
# - All known issues:                     robot -i KnowIssue* tags.robot
# - Ignore the known failing tests:       robot -e failing tags.robot
# - Both the smoke and regression tests:  robot -i smoke -i regression tags.robot
# - Ignore sometimes fails and not ready: robot -e SometimesFails -e NotReady tags.robot
# - Only the default tag:                 robot -i 'Invoice Team' tags.robot

*** Test Cases ***
Quick Check On System Status
    [Tags]  Smoke
    Log To Console    This is a quick chcek to make sure the system is up and running

Log Into The System
    [Tags]   Smoke  Regression
    Log To Console    This test verifies the login to the application

Navigation Bar Links Are Functional
    [Tags]   Regression  Acceptance
    Log To Console    This test goes through the navigation bar and verifies all links take you to the proper page
    #  Simulate "some time"
    Sleep  2secs

Thorough Check Of The Main Page
   [Tags]  Acceptance  Exhaustive
   Log To Console    Verification that all elements are on the main page
   # Simulate "long amount of time"
   Sleep  10secs

Test With Known Issue
   [Tags]  Regression  Acceptance  KnownIssue-66  Failing
   Log To Console    This test has a known issue
    #  Simulate "some time"
   Sleep  2secs
   Fail  Known Issue #66

Test With Another Known Issue
   [Tags]  Regression  KnownIssue-27  Failing
   Log To Console    This test has a known issue
   Fail  Known Issue #27

Test That Is Currently Under Development
   [Tags]  Regression  RunMe  NotReady
   Log To Console   Test Script in progress ...

Test With Traceabilty
   [Tags]  Acceptance  Requirement-A250
   Log To Console    A test with traceability that verifies requirement A250

Test With New, Unknown Issue
   [Tags]  Acceptance  SometimesFails
   Log To Console    This test presents a new, unknown issue
   Fail  New Issue

Test That Takes Some Time To Execute
   [Tags]  Exhaustive
   Log To Console    This test takes some long amount of time to execute
   # Simulate "long amount of time"
   Sleep  10secs

Test With Too Many Tags
   [Tags]  Smoke  Regression  Acceptance  Requirement-C143  Exhaustive  TestWithTooManyTags
   Log To Console    This test has too many tags

Test With No Tags
   Log To Console    This test has no tags. What happens?

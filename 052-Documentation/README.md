# Documentation

## Purpose:
Show users how to properly document their keywords through effective documentation and the lib. doc tool. 

## Learning Objectives:

- Trainees will be able to comment in tests so that documentation can be generated using the Testdoc tool
- Trainees will be able to generate documentation using the Testdoc tool

## Challenge:
Add documentation around the existing keywords in resources.robot and generate the html documentation. (15 min)

Use something like this to generate the html documentation for the keywords. For Windows,
``` 
python -m robot.libdoc --format HTML .\resources.robot .\resources.html 
```

For bash or Linux,
```
python -m robot.libdoc --format HTML ./resources.robot ./resources.html
```

For generating test documentation, use: 
```
python -m robot.testdoc .\documentation.robot .\documentation.html
```


## Extra Credit
Add documentation to the test suite and generate the html for it. `Hint: Instead of robot.libdoc for libraries you might use robot.testdoc for test suites and test cases`.

## Tips:
Documentation on how to create and generate documentation for keywords is here:

http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#user-keyword-name-and-documentation
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#supporting-tools
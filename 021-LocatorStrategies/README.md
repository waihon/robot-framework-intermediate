# Locator Strategies

## Purpose:
Learn what a locator strategy is and how to use them to identify elements

## Learning Objectives:

- Trainees will learn about the 3 major locators strategies (Default, CSS, and XPath)
- Trainees will differentiate between the "default" and "named" locator strategies
- Trainees will be able to point out the documentation for locator strategies
- Trainees will be able to tell which elements can be used with specific keywords
- Trainees will be able to talk about the difference between element specific keywords and generic element keywords

## Challenge:
Find an alternative method for selecting "Past Due" as the status, clicking the Create button, and navigating to the Add Invoice page (20 mins)

## Extra Credit:
Within locator-strategies.robot under the keyword `Click Add Invoice` we have this keyword

```
    Page Should Contain Element     invoiceNo_add
```

For extra credit, explain what strategy is being used? Given that strategy what search options are available
to the `Page Should Contain Element` keyword? Explain how you came to understand the answers to these questions.
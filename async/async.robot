*** Settings ***
Library     

*** Test Cases ***
Example Test
   ${handle}    async run    Task1
   ${handle2}      async run   Task2

    Log    Both tasks have started

    ${return_value1}    async get    ${handle}
    ${return_value2}    async get    ${handle2}

    Log    Both tasks have finished

*** Keywords ***
Task1
    Log    Task 1 started
    Sleep    2

    Log    Task 1 finished

Task2
    Log    Task 2 started
    Sleep    3
    Log    Task 2 finished
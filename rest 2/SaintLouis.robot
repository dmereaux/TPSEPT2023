*** Settings ***
Library               RequestsLibrary

*** Test Cases ***
Quick Get Request Test
    ${response}=      GET  https://www.google.com/search  params=query=ciao  expected_status=200
    Log To Console  ${response.content}
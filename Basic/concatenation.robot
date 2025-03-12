*** Settings ***
Test Template   Modele
Test Setup  Log To Console  je suis un setUp
Library  DataDriver   file=${CURDIR}${/}concatenation.csv
*** Test Cases ***
testPardefault 

*** Keywords ***
Modele
   [Arguments]  ${var1}  ${var2}  ${var3}
   ${ret}  catenate  ${var1}   ${var2}
   BuiltIn.Should Be Equal  ${ret}  ${var3}
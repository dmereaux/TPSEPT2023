*** Settings ***
Test Template   Comparer un entier avec une chaine 2

*** Test Cases ***
test1   80  ${80}
  [Documentation]  jeux1
test2   90  ${90} 
  [Documentation]  jeux2
*** Keywords ***
Comparer un entier avec une chaine 2
  [Arguments]   ${arg1}  ${arg2}
   Should Be Equal As Integers  ${arg1}  ${arg2}
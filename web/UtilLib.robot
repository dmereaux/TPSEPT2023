*** Settings ***
Library  maLibPython

*** Test Cases ***
test du random
   Repeat Keyword   10  hasard
   ${random} =	Evaluate	random.randint(0, sys.maxsize)
   Log To Console  ${random}
   ${x}   Evaluate   sys.maxsize
   Log To Console  ${x}
   
test addition
  ${x}  addition de chaine  1  2
  Log To Console  ${x} 
 
*** Keywords ***
hasard
   ${x}   maLibPython.random inf 12
   IF   ${x} > 12
      Fail
   END
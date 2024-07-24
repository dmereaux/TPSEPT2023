*** Settings ***
Test Template  Modele
*** Test Cases ***

Test1  Bonjour  Monsieur   Bonjour-Monsieur
Test2  Bonjour  Madame   Bonjour-Madame 

*** Keywords ***
concatenation
   [Arguments]  ${var1}  ${var2}
   ${sortie}   catenate  SEPARATOR=-  ${var1}  ${var2}
   RETURN  ${sortie}

Modele
   [Arguments]  ${var1}  ${var2}  ${var3}
   ${ret}  concatenation  ${var1}   ${var2}
   Should Be Equal  ${ret}  ${var3}
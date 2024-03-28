*** Settings ***
Test Template   modele concatenation
Library    DataDriver   file=data.csv

*** Test Cases ***
T${nom}
    
*** Keywords ***
modele concatenation 
   [Arguments]  ${ent1}   ${ent2}   ${sortie}
   ${ret}  Catenate  ${ent1}   ${ent2}
   Should Be Equal  ${ret}  ${sortie}
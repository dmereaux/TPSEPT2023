*** Settings ***
Library   tarif_ratp   ageLimit=13

*** Test Cases ***
age
   ${s}  Calcul Tarif   12
   Should Be Equal As Integers  ${s}  2
   modif age  14
   Log To Console  ${s}
   
age2
   ${s}  Calcul Tarif   13
   Should Be Equal As Integers  ${s}  4
   Log To Console  ${s}
   ${age}  recup age 
   Should Be Equal  ${age}  14

arguments
  Any Arguments  1  2  3  4  bonjour

test2
  Skippy
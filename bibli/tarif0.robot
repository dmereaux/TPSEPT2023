*** Settings ***
Library   tarif0  

*** Test Cases ***
age
   ${s}  Calcul Tarif   ${12}
   Should Be Equal   ${s}  demi tarif
 
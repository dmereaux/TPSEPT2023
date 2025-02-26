*** Settings ***
Library   tarif1   ${11}  

*** Test Cases ***
age
   ${s}  Calcul Tarif   ${12}
   Should Be Equal   ${s}  demi tarif
 
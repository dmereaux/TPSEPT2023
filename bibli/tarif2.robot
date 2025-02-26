*** Settings ***
Library   tarif2   ${11}  

*** Test Cases ***
age
   ${s}  tarif ratp   ${12}
   Should Be Equal   ${s}  demi tarif
 
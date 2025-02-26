*** Settings ***
Library   tarif3  ${11}  

*** Test Cases ***
age
   ${s}  tarif ratp   ${12}
   Should Be Equal   ${s}  plein tarif
 
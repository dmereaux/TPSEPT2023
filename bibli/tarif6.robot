*** Settings ***
Library   tarif6  11  

*** Test Cases ***
age
   ${s}  tarif ratp   12
   Should Be Equal   ${s}  plein tarif
arguments
  Any Arguments  1  2  3  4  bonjour
modification de la limite
    modifier age  2 
lecture de la limite
    ${age}  quel age
    Log To Console  ${age}

 
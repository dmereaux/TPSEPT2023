*** Settings ***
Library   tarif5  11  

*** Test Cases ***
age
   ${s}  tarif ratp   12
   Should Be Equal   ${s}  plein tarif
arguments
  Any Arguments  1  2  3  4  bonjour
 
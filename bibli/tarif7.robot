*** Settings ***
Library   tarif7  11  

*** Test Cases ***
age
   ${s}  tarif ratp   12
   Should Be Equal   ${s}  plein tarif
arguments
  Any Arguments  1  2  3  4  bonjour
modification de la limite
    utiliser 2 pour modifier l age limit
    ${lim}  quel age
    Log To Console  ${lim}

lecture de la limite
    ${age}  quel age
    Log To Console  ${age}
exception
    Fin Skip  
test en error
    comparer2valeurs

 
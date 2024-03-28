*** Settings ***
Library   wrapper_ratp

*** Test Cases ***
jeune
   ${tarif}  wrapper_ratp.Wrapper Calcul Tarif    ${9}
   Should Be Equal As Numbers    ${tarif}   1
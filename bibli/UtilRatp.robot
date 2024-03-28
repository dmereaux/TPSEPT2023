*** Settings ***
Library  ratp   limit=11

*** Test Cases ***
vérification import
  ${lim}   Get Limit
  Should Be Equal As Integers  ${lim}  11
appel du tarif
  ${val}  tarif 2024   10
  Should Be Equal As Numbers   ${val}   1
test du skip
  Skippy  titi
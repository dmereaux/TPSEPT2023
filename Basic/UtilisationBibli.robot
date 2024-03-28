*** Settings ***
Library  tarif   age=11   AS  T
Suite Setup  rien suite
Test Setup   rien du tout
Test Teardown  fin de test
*** Test Cases ***
test_tarif6
  ${tarif}   T.tarif ratp   6
  Should Be Equal   ${tarif}   demi tarif    probleme
test_tarif11
  ${tarif}   T.tarif ratp   12
  Should Be Equal   ${tarif}   plein tarif    probleme
  T.rien du tout
  T.Any Arguments   un   deux   trois  quatre
  T.Fin Skip

*** Keywords ***
fin de test 
   ${x}   T.Fin
   Log To Console  ${x}
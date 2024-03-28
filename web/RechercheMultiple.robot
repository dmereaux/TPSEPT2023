*** Settings ***
Library   SeleniumLibrary
Library   DataDriver  file=donnees.csv
Resource   prestaMotcle.resource
Test Setup   ouvrir prestashop
Test Teardown   fermer prestashop
Test Template   modele de recherche
*** Test Cases ***
${test}

*** Keywords ***
modele de recherche
  [Arguments]   ${item}  ${msg}
  Faire une recherche avec   ${item}
  Verifier Page recherche
  verifier Msg Recherche   ${msg}
  verifier presence mot  ${item}
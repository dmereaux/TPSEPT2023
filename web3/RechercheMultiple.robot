*** Settings ***
Library   SeleniumLibrary
Library   DataDriver  file=donnees.csv
Resource   motClefPresta.resource
Test Setup   ouvrir prestashop
Test Teardown   fermer prestashop
Test Template   modele de recherche
*** Test Cases ***
${test}

*** Keywords ***
modele de recherche
  [Arguments]   ${item}  ${msg}
  Faire une recherche   ${item}
  Contrôler le résultat de recherche égal à   ${msg}
  Contrôler pertinence de la recherche  ${item}
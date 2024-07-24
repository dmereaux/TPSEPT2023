*** Settings ***
Resource  motClefPresta.resource
Test Setup    Ouvrir Prestashop
Test Teardown   Fermer Prestashop
Test Template  Modele de recherche
Library   DataDriver  file=data.csv

*** Test Cases ***
${nomdutest}

*** Keywords ***
Modele de recherche
    [Arguments]   ${item}  ${res}
    Faire une recherche  ${item}
    Contrôler le résultat de recherche égal à     ${res}
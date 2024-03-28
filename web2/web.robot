*** Settings ***
Resource   web.resource
Test Setup   ouvrir prestashop
Test Teardown  fermer prestashop
Test Template    modele de recherche
Library           DataDriver  file=toto.csv

*** Test Cases ***

${NomTest}  


*** Keywords ***
modele de recherche
  [Arguments]   ${Item}   ${res}
   Rechercher produit   ${Item}
   Verifier resultat recherche   ${res}
  
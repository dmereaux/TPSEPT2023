*** Settings ***
Resource  ${CURDIR}/${RESSOURCE}
Test Setup  ouvrir prestashop
Test Teardown  fermer prestashop
Test Template  modele de recherche
Library  DataDriver  file=data.csv

*** Variables ***
${RESSOURCE}  prestashop.resource

*** Test Cases ***
recherche

*** Keywords ***
modele de recherche
   [Arguments]  ${item}  ${resultat}
   Rechercher un item  ${item}
   vérifier résultat de recherche  ${resultat}
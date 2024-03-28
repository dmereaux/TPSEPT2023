*** Settings ***
Resource  googleMotcle.resource
Test Setup  Ouvrir session
Test Teardown  fermer session
*** Test Cases ***
test1
  Faire une requete et afficher la réponse
  ${resp}  Faire une requete et récuperer la réponse
  Contrôler rejet  ${resp}
  
*** Settings ***
Resource  googleMotcle.resource
Test Setup  Ouvrir session
Test Teardown  Fermer session
*** Test Cases ***
test1
  [Tags]  tag1
  Faire une requete et afficher la réponse
  ${resp}  Faire une requete et récuperer la réponse
  Contrôler rejet  ${resp}
test2
  should be true   True
test3
  Faire une requete et afficher la réponse
  ${resp}  Faire une requete et récuperer la réponse
  Contrôler rejet  ${resp}
test4
  Faire une requete et afficher la réponse
  ${resp}  Faire une requete et récuperer la réponse
  Contrôler rejet  ${resp}
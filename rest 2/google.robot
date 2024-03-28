*** Settings ***
Resource  googleMotcle.resource
Test Setup  Ouvrir session
Test Teardown  fermer session
*** Test Cases ***
test1
  Faire une requete
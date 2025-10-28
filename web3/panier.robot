*** Settings ***
Resource  motClefPresta.resource
Test Setup    Ouvrir Prestashop
Test Teardown   Fermer Prestashop


*** Test Cases ***
test panier cliqueable
  panier cliqueable

test impot
    Aller sur page impot
    bouton continuer cliqueable
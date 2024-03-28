*** Settings ***
Documentation   Ma suite qui fait pas grand chose
Library  calcul_tarif.py
Resource   bibli.resource
Test Template  verification

*** Test Cases ***
test avec 12 ans    12   plein tarif
Test avec 6 ans     6   demi tarif



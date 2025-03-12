*** Settings ***
Resource  motClefPresta.resource
#Test Setup    Ouvrir Prestashop
#Test Teardown   Fermer Prestashop

*** Test Cases ***
test navigateur
  Ouvrir Prestashop
  Fermer Prestashop
Recherche MUG
   Faire une recherche  MUG
   Contrôler le résultat de recherche égal à     Il y a 5 produits.
   Contrôler pertinence de la recherche   MUG
Recherche T-Shirt
  Faire une recherche   T-Shirt 
  Contrôler le résultat de recherche égal à     Il y a 1 produit.
Recherches diverses
  [Template]   Modele Recherche
  MUG   Il y a 5 produits.
  mug   Il y a 5 produits.
  T-Shirt   Il y a 1 produit.
  Coussin   Il y a 3 produits.

Recherche vide
  Faire une recherche   ${EMPTY}
  Vérifier message recherche vide

Menu Femmes
   menu femmes invisible
   Survoler menu vêtement
   Menu femmes visible
   Aller sur menu femmes
   Vérifier S non sélectionné
   Selectionné S
   Vérifier S sélectionné

Test alerte
  [Setup]  Ouvrir W3C alerte
  Accepter RGPD
  Afficher l'alerte
  Vérifier alerte présente
  Vérifier alerte absente

Combien de fenêtres
  Afficher la liste des Handles

Test de la librairie
   Ma Fonction

test checkbox
  Selectionner le premier element populaire
  
  verifier noir non selectionné

*** Keywords ***
Modele Recherche
   [Arguments]   ${item}   ${msg}
   Aller à la page d'accueil
   Faire une recherche  ${item}
   Contrôler le résultat de recherche égal à     ${msg}
   Contrôler pertinence de la recherche   ${item}



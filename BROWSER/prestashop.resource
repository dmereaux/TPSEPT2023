*** Settings ***
library  Browser  
*** Variables ***
${URL}   http://prestashop.qualifiez.fr/
${BROWSER}   chromium
${LOC CHAMP RECHERCHE}   //*[@id="search_widget"]/form/input[2]
${LOC RESULTAT}   //*[@id="js-product-list-top"]/div[1]/p
*** Keywords ***
ouvrir prestashop
  New Browser  ${BROWSER}  False
  New Page
  Go To   ${URL}  10
  Get Title  ==  monPrestashop 
  
fermer prestashop
  Close Browser

saisir du texte

   @{etat}  Get Element States   ${LOC CHAMP RECHERCHE}
   Log To Console   ${etat}
   Should Contain  ${etat}  editable

Rechercher un item
  [Arguments]   ${item}
  Fill Text   ${LOC CHAMP RECHERCHE}  ${item}
  Press Keys   ${LOC CHAMP RECHERCHE}   Enter

vérifier résultat de recherche
   [Arguments]  ${msg}
   Get Text  ${LOC RESULTAT}  ==  ${msg}
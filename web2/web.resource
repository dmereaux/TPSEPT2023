*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${URL}    http://prestashop.qualifiez.fr
${Browser}   ff  
${LOC TEXTE}  xpath=//*[@id="js-product-list-top"]/div[1]/p
${LOC_RECHERCHE}  //*[@id="search_widget"]/form/input[2]
*** Keywords ***
ouvrir prestashop
   Open Browser   ${URL}   ${Browser}
fermer prestashop
   Close Browser
Rechercher produit
   [Arguments]   ${produit}
   Input Text   ${LOC_RECHERCHE}   ${produit}
   Press Keys   ${LOC_RECHERCHE}   RETURN

Verifier resultat recherche
     [Arguments]   ${msg_attendu}
     Wait Until Element Is Visible    ${LOC TEXTE}   5
     Element Text Should Be   ${LOC TEXTE}   ${msg_attendu}
action specifique
  log to console   pb
  
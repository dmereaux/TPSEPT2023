*** Settings ***
#Library   ma_lib_selenium.py
Library   SeleniumLibrary   #implicit_wait=5
*** Variables ***
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${URL2}  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert
${NAVIGATEUR}     GC
#${PATH_GC}   /Users/dominiquemereaux/code/driver/chromedriver
${LOC_CHAMP_RECHERCHE}   xpath=//*[@id="search_widget"]/form/input[2]
${LOC_NOMBRE_RESULTATS}   //*[@id="js-product-list-top"]/div[1]/p
${LOC_LIEN_RECHERCHE}   //*[@id="js-product-list"]//article/div/div[2]/h2/a
${LOC_ICONE}   //*[@id="_desktop_logo"]//a/img
${LOC_MESSAGE_ERREUR}   //*[@id="product-search-no-matches"]
${MESSAGE ERREUR}   Aucun produit ne correspond à votre recherche
${LOC_checkbox}    //*[@id="search_filters"]/section/ul/li[1]/label/span/input
${LOC_MENU_VETEMENT}  //*[@id="category-3"]/a
${LOC_MENU_FEMMES}   //*[@id="category-5"]/a

*** Keywords ***
Ouvrir W3C alerte
   Open Browser  ${URL2}  ${NAVIGATEUR}   #executable_path=${PATH_GC}
   Maximize Browser Window

Afficher l'alerte
   Select Frame  id=iframeResult
   Click Element  //button

Vérifier alerte présente
   Alert Should Be Present  

Vérifier alerte absente
   Alert Should Not Be Present

Accepter RGPD
    Click Element  id=accept-choices

Ouvrir Prestashop
   Open Browser  ${URL}  ${NAVIGATEUR}  
   Title Should Be  monPrestashop
#   ma_lib_selenium.Ma Fonction
Fermer Prestashop
  Close Browser
  
Faire une recherche
  [Arguments]   ${item}
  Wait Until Element Is Visible   ${LOC_CHAMP_RECHERCHE}
  Input Text   ${LOC_CHAMP_RECHERCHE}   ${item}
  Press Keys	${LOC_CHAMP_RECHERCHE}	RETURN
  Wait For Condition	return document.title == "Rechercher"  timeout=5

Contrôler le résultat de recherche égal à
  [Arguments]    ${texte-a-vérifier}
  Wait Until Element Is Visible   ${LOC_NOMBRE_RESULTATS}  5
  Element Text Should Be     ${LOC_NOMBRE_RESULTATS}   ${texte-a-vérifier}

Contrôler pertinence de la recherche
  [Arguments]   ${mot}
  @{listeLien}   Get WebElements   ${LOC_LIEN_RECHERCHE}
  FOR   ${lien}   IN     @{listeLien}
      Element Should Contain  ${lien}   ${mot}   ignore_case=True
  END

Aller à la page d'accueil
  Click Element   ${LOC_ICONE}

Vérifier message recherche vide
   Element Text Should Be   ${LOC_MESSAGE_ERREUR}   ${MESSAGE ERREUR} 
  
Survoler menu vêtement
   Mouse Over    ${LOC_MENU_VETEMENT}
Menu femmes visible
   Element Should Be Visible   ${LOC_MENU_FEMMES} 
Menu femmes invisible  
   Element Should Not Be Visible   ${LOC_MENU_FEMMES} 
Aller sur menu femmes
    Mouse Over    ${LOC_MENU_VETEMENT}
    Click Element   ${LOC_MENU_FEMMES} 
    Title Should Be   Femmes
Vérifier S non sélectionné
    Checkbox Should Not Be Selected   ${LOC_checkbox}
Vérifier S sélectionné   
    Checkbox Should Be Selected   ${LOC_checkbox}
Selectionné S
    Click Element   ${LOC_checkbox}

Afficher la liste des Handles
    @{listHandles}  Get Window Handles
    FOR  ${elt}  IN  @{listHandles}
       Log To Console  ${elt}
    END

Selectionner le premier element populaire
   click element   //*[@id="content"]/section[1]/div/div[1]/article/div/div[1]/a/picture/img

verifier noir non selectionné
  Wait Until Element Is Visible  //*[@id="group_2"]/li[2]/label  timeout=5
  Element Should Be Enabled   //*[@id="group_2"]/li[2]/label/input
  Element Should Be Disabled   //*[@id="group_2"]/li[1]/label/input
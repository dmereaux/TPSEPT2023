*** Settings ***
Library   maLib
*** Variables ***
${URL}    http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${URL2}   https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert
${BROWSER}   gc
${PATH}   /Users/dominiquemereaux/code/driver/chromedriver
${LOC_CHAMPRECHERCHE}    xpath=//*[@id="search_widget"]/form/input[2]
${LOC_BOUTONRECHERCHE}   xpath=//*[@id="search_widget"]/form/button
${LOC_MESSAGE}    xpath=//*[@id="js-product-list-top"]/div[1]/p
${LOC_DESCPRODUIT}   xpath=//*[@id="js-product-list"]/div[1]/article/div/div[1]/h2/a
${LOC_MENUWOMEN}   xpath=//*[@id="category-5"]/a
${LOC_CLOTHES}   xpath=//*[@id="category-3"]/a
${LOC_RGPD}    id=accept-choices
${LOC_FRAME}   id=iframeResult
${LOC_TRYIT}   xpath=/html/body/button

*** Keywords ***
ouvrir prestashop
  Open Browser   ${URL}    ${BROWSER}   executable_path=${PATH} 
#  Set Selenium Speed  0.5
  Set Browser Implicit Wait  5
  Title Should Be   monPrestashop
  Bidon
ouvrir W3C
  Open Browser   ${URL2}    ${BROWSER}   executable_path=${PATH} 
#  Set Selenium Speed  0.5
  Set Browser Implicit Wait  5
  Maximize Browser Window 
fermer prestashop
  Close Browser

Faire une recherche avec
  [Arguments]  ${item}
    Wait Until Element Is Visible  ${LOC_CHAMPRECHERCHE}  5
    Input Text   ${LOC_CHAMPRECHERCHE}   ${item}
    Press Keys  ${LOC_CHAMPRECHERCHE}   RETURN
Verifier Page recherche
   Title should be    Rechercher
verifier Msg Recherche
   [Arguments]  ${Expected}
       Element Text Should Be    locator=${LOC_MESSAGE}   expected=${Expected}   message=ca ne marche pas
verifier presence mot
  [Arguments]   ${item}
   @{descriptions}    Get WebElements   locator=${LOC_DESCPRODUIT}
    FOR    ${desc}   IN   @{descriptions} 
       Element Should Contain   ${desc}   ${item}   ignore_case=True
    END
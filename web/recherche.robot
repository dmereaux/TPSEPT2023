*** Settings ***
Library   maLib
Resource   prestaMotcle.resource
Test Setup   ouvrir prestashop
Test Teardown   fermer prestashop
Library   Collections

*** Test Cases ***
test bidon
  [Setup]
  Log To Console  bidon
  [Teardown]
recherche MUG
  Faire une recherche avec   MUG
  Verifier Page recherche
  verifier Msg Recherche   There are 5 products.
  verifier presence mot  Mug

recup options
  ${options} =	Evaluate	selenium.webdriver.ChromeOptions().capabilities	modules=selenium.webdriver
  Log To Console  ${\n}capabilities: ${options}
  ${x}  Evaluate   dir(selenium.webdriver.ChromeOptions())
  Log To Console  ${x}
  
verifier presence menu
   Element Should Not Be Visible   ${LOC_MENUWOMEN}
   Mouse Over    ${LOC_CLOTHES}
   Element Should Be Visible   ${LOC_MENUWOMEN}
   Click Element   ${LOC_MENUWOMEN}
   @{listeFen}  Get Window Handles
   FOR  ${elt}  IN  @{listeFen}
      Log To Console   ${elt}
    END

Gestion des alertes
  [Setup]   ouvrir W3C
  Click Element   ${LOC_RGPD}
  Select Frame   ${LOC_FRAME}
  Click Element  ${LOC_TRYIT}
  ${msg}  Handle Alert  
  Should Be Equal   ${msg}   Hello! I am an alert box!
  



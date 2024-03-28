*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***
${CHUCKENDPOINT}   https://api.chucknorris.io
${BLAGUEAUHASRD}   /jokes/random
${CATEGORIES}   /jokes/categories 

*** Keywords ***
Ouvrir session
   Create Session   chuck   ${CHUCKENDPOINT}  disable_warnings=${True}
fermer session
   Delete All Sessions
dump resp
  ${resp}   get on session   chuck  ${BLAGUEAUHASRD}  expected_status=200
  Dump Json To File   toto.json   ${resp.json()} 

recuperer une blague
   ${resp}   get on session   chuck  ${BLAGUEAUHASRD}  expected_status=200  
   ${resp2}   get value from json   ${resp.json()}  $.value
   should be equal   ${resp.json()}[value]   ${resp2}[0] 
   ${resp3}  Get From Dictionary  ${resp.json()}  value 
   should be equal   ${resp.json()}[value]   ${resp3} 
   ${result}=	Load Json From File	 toto.json
#   Dictionaries Should Be Equal   ${result}  ${resp.json()}
   [Return]  ${resp.json()}[value]
recuperer une blague de categorie:
   [Arguments]  ${categorie}
   ${resp}   get on session   chuck  ${BLAGUEAUHASRD}  params=category=${categorie}  expected_status=200
   [Return]  ${resp.json()}[value]

vérifier chuck dans blague
   [Arguments]  ${blague}
   Should Contain   ${blague}   Chuck

recupérer les categories
   ${resp}   get on session   chuck  ${CATEGORIES}  expected_status=200
   [Return]  ${resp.json()}

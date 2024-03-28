*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary   
Library  JSONLibrary

*** Variables ***
${SESSION_NAME}   Chuck
${ENDPOINT}  https://api.chucknorris.io/
${BLAGUE_AU_HASARD}   jokes/random
${CATEGORIES}   jokes/categories

*** Keywords ***
Session Chuck
    Create Session  ${SESSION_NAME}    ${ENDPOINT}   disable_warnings=True
Blague au hasard 
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   expected_status=200
  ${toto}  Get From Dictionary   ${resp.json()}   value
  Should Be Equal  ${toto}  ${resp.json()}[value]
  ${titi}  Get Value From Json   ${resp.json()}  $.value
  Should Be Equal  ${titi}[0]  ${resp.json()}[value]
  RETURN   ${resp.json()}[value]
Blague de catégorie
  [Arguments]  ${cat}
  &{dict}  Create Dictionary  category=${cat}
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}  params=&{dict}  expected_status=200
  RETURN   ${resp.json()}[value]   ${resp.json()}[categories]
recupérer la liste des catégories
    ${resp}   GET On Session   ${SESSION_NAME}   ${CATEGORIES}
    RETURN  ${resp.json()} 
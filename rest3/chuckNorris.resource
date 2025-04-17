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
Afficher contenu
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   expected_status=200
  log to console  ${resp.json()}[value]
  # bibliothèque collection 
  ${value}  Get From Dictionary   ${resp.json()}   value
  log to console  ${value}
  #bibliothèque Json
  ${value}  Get Value from json   ${resp.json()}   value
  log to console  ${value}
Blague au hasard 
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   #expected_status=200
  #
  ${toto}  Get From Dictionary   ${resp.json()}   value
  Should Be Equal  ${toto}  ${resp.json()}[value]
  ${titi}  Get Value From Json   ${resp.json()}  $.value
  Should Be Equal  ${titi}[0]  ${resp.json()}[value]
  RETURN   ${resp.json()}[value]
Blague de catégorie
  [Arguments]  ${cat}
  &{dict}  Create Dictionary  category=${cat}
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}  params=&{dict}  #expected_status=200
  RETURN   ${resp.json()}[value]   ${resp.json()}[categories]
recupérer la liste des catégories
    ${resp}   GET On Session   ${SESSION_NAME}   ${CATEGORIES}
    RETURN  ${resp.json()} 
Fermer session chuck
    Delete All Sessions 
Blague au hasard avec categorie
  [Arguments]  ${cat}
  ${resp}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   params=category=${cat}  expected_status=200
  RETURN   ${resp.json()}[value]
Récuperer une blague de catégorie ${cat1} puis de catégorie ${cat2}
  ${resp1}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   params=category=${cat1}  expected_status=200
  ${resp2}   GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   params=category=${cat2}  expected_status=200
  RETURN   ${resp1.json()}[value]  ${resp2.json()}[value]
Afficher des blagues avec les catégories ${list} :
    FOR  ${elt}  IN  @{list}
        ${resp1}  GET On Session   ${SESSION_NAME}   ${BLAGUE_AU_HASARD}   params=category=${elt}  expected_status=200
        Log To Console  ${resp1.json()}[value]
    END
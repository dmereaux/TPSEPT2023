*** Settings ***
Resource  chuckMotCle.resource
Library    RequestsLibrary
Library   Collections 
Library   JSONLibrary
Test Setup  Ouvrir session
Test Teardown  fermer session

*** Test Cases ***
Afficher une blage
  Create Session  toto  ${CHUCKENDPOINT}  disable_warnings=True
  ${resp}   get on session  toto  ${BLAGUEAUHASRD}  expected_status=200
  Log To Console  ${resp.json()}[value] 
  ${blage}  Get From Dictionary   ${resp.json()}   value
  Should Be Equal  ${blage}  ${resp.json()}[value] 
  @{blage}  Get Value From Json   ${resp.json()}   value
  Should Be Equal  ${blage}[0]  ${resp.json()}[value] 
  ${resp}   get on session  toto  ${BLAGUEAUHASRD}  params=category=animal  expected_status=200
  Log To Console  ${resp.json()}[value] 



blague test
   ${blague}   recuperer une blague
   Log To Console   ${blague} 
   vérifier chuck dans blague   ${blague}

blague dans fichier
   dump resp  

blague animal
   ${blague}   recuperer une blague de categorie:    animal
   Log To Console   ${blague} 
   vérifier chuck dans blague   ${blague}

afficher et contrôler une blague de chaque catégorie
   @{liste}   recupérer les categories
   FOR   ${cat}   IN   @{liste} 
      ${blague}   recuperer une blague de categorie:    ${cat}
      Log To Console   ${blague} 
      vérifier chuck dans blague   ${blague}
   END

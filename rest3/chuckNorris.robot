*** Settings ***                                                                                       
Resource  chuckNorris.resource
Suite Setup    Session Chuck 
Suite Teardown   Fermer session chuck  
Documentation   type de terminal %{TERM}           
                                                                                                       
*** Test Cases ***     

afficher
    Afficher contenu

Test Blague au hasard
  [Tags]  tag1
  ${blague}   Blague au hasard
  should contain  ${blague}   Chuck   ignore_case=True

test Blague animal
  [Tags]  tag2
  ${blague}   ${cat}   Blague de catégorie   animal
  Should Be Equal   ${cat}[0]   animal
  should contain  ${blague}   Chuck   ignore_case=True

test Blague food
  [Tags]  tag2
  ${blague}   ${cat}   Blague de catégorie   food
  Should Be Equal   ${cat}[0]   food
  should contain  ${blague}   Chuck   ignore_case=True

test Blague work
  ${blague}   ${cat}  ${statut}  Blague de catégorie   work
  Should Be Equal   ${cat}[0]   work
  should contain  ${blague}   toto   ignore_case=True



Tester une blague de chaque catégorie
   @{liste_cat}   recupérer la liste des catégories
   FOR   ${elt}   IN  @{liste_cat}  
     ${blague}   ${cat}   Blague de catégorie   ${elt}
     log to console  ${cat}
     log to console  ${blague}
     Should Be Equal   ${cat}[0]   ${elt}
     should contain  ${blague}   Chuck   ignore_case=True  
   END

afficher la liste des catégories
   @{categories}   recupérer la liste des catégories
   FOR  ${elt}  IN  @{categories} 
     Log To Console  ${elt}
     ${blague}   ${cat}   Blague de catégorie   ${elt}
     Log To Console  categorie:${cat}[0] Blague:${blague}
   END

test embedded
  ${blague1}  ${blague2}  Récuperer une blague de catégorie animal puis de catégorie science
  log to console  ${blague1}
  log to console  ${blague2}   
test embedded 2
  VAR    @{list}    science  animal
  Afficher des blagues avec les catégories @{list} :

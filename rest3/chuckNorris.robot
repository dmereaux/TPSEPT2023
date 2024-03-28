*** Settings ***                                                                                       
Resource  chuckNorris.resource
Suite Setup    Session Chuck                 
                                                                                                       
*** Test Cases ***     
Test Blague au hasard
  ${blague}   Blague au hasard
  should contain  ${blague}   Chuck   ignore_case=True

test Blague animal
  ${blague}   ${cat}   Blague de catégorie   animal
  Should Be Equal   ${cat}[0]   animal
  should contain  ${blague}   Chuck   ignore_case=True

Tester une blague de chaque catégorie
   @{liste_cat}   recupérer la liste des catégories
   FOR   ${elt}   IN  @{liste_cat}  
     ${blague}   ${cat}   Blague de catégorie   ${elt}
     log to console  ${cat}
     log to console  ${blague}
     Should Be Equal   ${cat}[0]   ${elt}
     should contain  ${blague}   Chuck   ignore_case=True  
   END
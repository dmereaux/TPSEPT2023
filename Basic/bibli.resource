*** Settings ***
Documentation   Ma suite qui fait pas grand chose
Library  calcul.MaLibrairie2  9
Library  calcul.MaLibrairie  
*** Variables ***
${URL}    http://toto.fr
@{maListe}    un  deux  trois  quatre
&{monDict}   nom=mereaux   prenom=dominique  ville=Bagneux
*** Keywords ***
verification 
  [Arguments]   ${age}   ${tarif}
     # appel de la fonction
     ${prix}   Nouveau Nom   ${age}
     # vérifie l'attendu par rapport à l'obtenu
     BuiltIn.Should Be Equal   ${tarif}   ${prix}    test avec ${age} en échec
mot clef simple
   Log To Console  pas de problèmes
Mot clef complexe
  [Documentation]   ceci est un mot cle propriétaire
  [Arguments]  ${arg1}   ${arg2}
  Log To Console  ${arg1}
  Log To Console  ${arg2}
  RETURN  ${arg1}  
debut de test
  log to console   ${\n} debut du test
fin de test
  log to console   ${\n} fin de test en :${TEST STATUS}
test en echec
   Log To Console   c'est pas bon
nombre au hasard
    ${random} =	Evaluate	random.randint(0, 10)
    log to console  ${random}
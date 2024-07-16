*** Settings ***
#Documentation   Ma suite qui fait pas grand chose
Test Setup    debut de test
Test Teardown   fin de test
Suite Setup   debut de suite
Suite Teardown   fin de suite
#Test Teardown   Run Keyword If Test Failed   test en echec
#Suite Setup   Log To Console  debut de suite
#Suite Teardown  Log To Console   fin de suite
Library  String


Library  calcul.MaLibrairie  
Test Tags   toto


*** Variables ***
${URL}   http://monsite.com
${BROWSER}     google Chrome
@{maliste}   1  2  3   4  2
&{Mon Dict}   animal=canari   nom=titi
@{liste}   split string  toto   titi

*** Test Cases ***

TP1
  [Setup] 
  Log to console   Bonjour les amis

TP1 Optionnel
    Log  Bonjour les Amis  WARN
    log  Une erreur   ERROR

TP2 test variable globale
  Log To Console  site à tester: ${URL}
  Log To Console   ${maListe}[1]
  Log To Console  ma liste @{maliste}
  Log To Console  Mon ${Mon Dict}[animal] s'appele ${Mon Dict}[nom]


TP2-bis test variable globale
  [Tags]  Regression
  Set Test Variable  ${URL}  http://toto.com
  Log To Console  site à tester: ${URL}

TP2-ter
  Log To Console  site à tester: ${URL}

TP2-Bis Optionnel déclaration variable locale au test
   set test variable  ${locale}   truc muche
   Set Global Variable   ${locale}

TP2-Bis Optionnel utilisation variable
   Log To Console   ${locale}

TP2-1: Affichage repertoire
  Log To Console  ${\n}${EXECDIR}
  Log To Console  ${\n}${CURDIR}
  Log To Console  ${\n}${TEMPDIR}

TP2-2 variable predefinies
  [Tags]  robot:continue-on-failure
  log to console   bonjour${SPACE}${SPACE}toto
  should be Equal   80  ${80}
  Should Be Equal  ${80}   80
  log to console   mon test n'a pas marché
TP2-2 optionnel
# expression python d'ou la presence de guillemets
  skip if  "${PREV_TEST_STATUS}" == "FAIL"
TP2-2 affichage du statut du test précédent
  log to console   ${PREV_TEST_STATUS}



TP3: test des mot cles
  [Documentation]    cas de test 1
  mot clef simple
TP3-1
  ${sortie}   Mot clef complexe  hello  world
  Log To Console   sortie :${sortie}


TP3-3  
   ${sortie}  mot clef avec Arguments   machin
   Log To Console  ${sortie}
TP3-2 
  ${S1}  ${S2}  mot clef qui retourne plusieurs valeurs
  log to console  sortie1:${S1}  sortie2:${S2}

TP6 BDD
  Given log to Console  ${\n}un individu
  When Log to Console   il fait qqch
  Then Log To Console   Il se passe qqch  


TP7 boucle sur la liste
  FOR  ${elt}   IN  @{maListe}
    Log To Console   ${elt}
  END


TP7 Optionnel
  ${nb}   Get Count  ${maliste}   2
  IF  ${nb}==2
    Log To Console   c'est bon
  END
  ${nb}   Get Count  ${maliste}   3
  IF  ${nb}==1
    Log To Console   c'est bon
  END 

TP8
    ${prix}   Calcul Tarif   13
     # vérifie l'attendu par rapport à l'obtenu
     Should Be Equal   plein tarif   ${prix}    test avec 13 en échec



TP9 verification tarif RATP
  [Template]    verification
  12      demi tarif
  11      demi tarif
  4       demi tarif
  2       demi tarif


Creation de list
  @{liste}  Split String  il-fait-beau  separator=-
  


test concatenation
   ${ret}  Catenate  Bonjour   Monsieur
   Should Be Equal  ${ret}  Bonjour Monsieur

Test concatenation multiples
  [Template]  modele concatenation
  Bonjour  Monsieur  Bonjour Monsieur
  Bonjour  madame   Bonjour madame

nombres au hasard
   Repeat Keyword    5 times   nombre au hasard
  
*** Keywords ***
modele concatenation 
   [Arguments]  ${ent1}   ${ent2}   ${sortie}
   ${ret}  Catenate  ${ent1}   ${ent2}
   Should Be Equal  ${ret}  ${sortie}
# TP3
mot clef simple
  [Documentation]   CECI EST UN MOT CLEF
  Log To Console  toto
  Log To Console  titi
# TP3-1
mot clef avec Arguments
  [Documentation]    CECI EST UN MOT CLEF
  [Arguments]  ${toto}  ${opt}=titi
  RETURN   j'affiche ${toto} ${opt} 
# TP3-2
mot clef qui retourne plusieurs valeurs
   RETURN  val1   val2
Mot clef complexe
  [Documentation]   ceci est un mot cle propriétaire
  [Arguments]  ${arg1}   ${arg2}
  Log To Console  ${arg1}
  Log To Console  ${arg2}
  RETURN  ${arg1}  

#TP4
fin de test
   log to console   ${\n}status du test:${TEST_STATUS}
debut de test
    Log To Console  ${\n}debut du test: ${TEST_NAME}
debut de suite
   log to console   ${\n}debut de la suite
fin de suite
  Log To Console   ${\n}fin de la suite
#TP9
verification 
  [Arguments]   ${age}   ${tarif}
     # appel de la fonction
     ${prix}   Calcul Tarif   ${age}
     # vérifie l'attendu par rapport à l'obtenu
     Should Be Equal   ${tarif}   ${prix}    test avec ${age} en échec
nombre au hasard    
    ${random} =	Evaluate	random.randint(0, 10)
    log to console  ${random}


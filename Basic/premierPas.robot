*** Settings ***
Documentation   Ma suite qui fait pas grand chose
Test Setup    debut de test
#Test Teardown   fin de test
Suite Setup   debut de suite
Suite Teardown   fin de suite
Test Teardown   Run Keyword If Test Failed   test en echec
#Suite Setup   Log To Console  debut de suite
#Suite Teardown  Log To Console   fin de suite


Resource  bibli.resource
Test Tags   toto
library  String

*** Variables ***
${BROWSER}     google Chrome
@{maliste2}   1  2  3   4  2

*** Test Cases ***
test variable globale
  Log To Console  site à tester: ${URL}

boucle sur la liste
  FOR  ${elt}   IN  @{maListe2}
    Log To Console   ${elt}
  END
  ${nb}   Get Count  ${maliste2}   2
  IF  ${nb}==2
    Log To Console   c'est bon
  END
  ${nb}   Get Count  ${maliste2}   3
  IF  ${nb}==1
    Log To Console   c'est bon
  END 
test de la liste
  [Setup]  
  Log To Console  2 item de la liste: ${maListe}[1]
  ${maListe2}   Create List   rouge  blanc  vert  jaune 
  Log To Console  2 item de la liste: ${maListe2}[1]
  Log To Console   ${maListe2}
  Set Global Variable   ${maListe2}
  FOR   ${elt}  IN  @{maListe}
      Log To Console   ${\n}${elt}
      # dans un if on fait une evaluation
      IF   "${elt}"=="un"
        Log To Console   Hourra
      END
  END


test du dictionnaire
  Log To Console  ${monDict}[ville]
  Log To Console  ${monDict.nom}

test affichage global var
   Log To Console   var glob:${maListe2}
test des mot cles
  [Documentation]    cas de test 1
  mot clef simple
  ${sortie}   Mot clef complexe  hello  world
  Log To Console   sortie :${sortie}
test 2
  [Documentation]    cas de test 2
  [Tags]  regression
  Log To Console  test2

Affichage repertoire
  Log To Console  ${\n}${EXECDIR}
  Log To Console  ${\n}${CURDIR}
  Log To Console  ${\n}${TEMPDIR}
variable predefinies
  log to console   bonjour${SPACE}${SPACE}toto
  Should Be Equal As Integers   80  ${80}
#  Should Be Equal  ${80}   80

test du statut
  Log To Console  ${\n}${TEST NAME}:${PREV_TEST_STATUS}
  log    bonjour  INFO
  log    il y a un pb  ERROR

verification tarif RATP
  [Template]    verification
  12      demi tarif
  11      demi tarif
  4       demi tarif
  2       demi tarif

test a skipper
  Skip If   "${PREV TEST STATUS}"=="FAIL"
  Log To Console   test non skippé

Test des mots clefs
  [Documentation]  DOC
  [Tags]   non regression   majeur
  [Setup]   Log To Console   ceci est mon nouveau setup
  [Teardown]
  VAR  ${x}  2
  Log To Console  ${x} 
   ${ret}  ${ret2}  ${ret3}  mot clef avec Arguments    xxx
   Log To Console  ${ret}
   ${ret}   mot clef avec Arguments    xxx  opt=tata
   Log To Console  ${ret}
   log to Console  ${ret2}
   Set Global Variable  ${ret}

afficher le navigateur
  [Tags]  majeur
  Log To Console   ${BROWSER}
  Log To Console  ${ret}

test liste
  [Tags]  majeur
   @{toto}  Split String   il a plu ce matin
   Log To Console  ${toto}[0]
   Log To Console   ${toto}[1]
   @{list} 	Create List	 a	b 	c
   Log To Console  ${list}[0]
   Log To Console   ${list}[1]
   Log To Console   ${maliste2}[0]
Test entier Chaine
    [Tags]  majeur
   Should Be Equal   80   ${80}
   log to console  bonjour${SPACE}${SPACE}la suite
   Should Be True  ${True}
   #Should Be Equal  ${PREV_TEST_STATUS}  PASS
   Log To Console  nom du test:${TEST_NAME}
test après
      [Tags]  majeur
  Skip If   "${PREV_TEST_STATUS}" == "FAIL"   msg=test d'avant en échec
  log to console    test non skippé

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
mot clef simple
  [Documentation]   CECI EST UN MOT CLEF
  Log To Console  toto

mot clef avec Arguments
  [Documentation]   CECI EST UN MOT CLEF
  [Arguments]  ${toto}  ${opt}=titi
  RETURN   j'affiche ${toto} ${opt}   essai1   essai2

fin de test
   log to console   ${\n}stat:${TEST_STATUS}
debut de test
    Log To Console  ${\n}debut du test: ${TEST_NAME}
debut de suite
   log to console   ${\n}debut de la suite
fin de suite
  Log To Console   ${\n}fin de la suite


*** Settings ***
Test Tags  toto
Documentation   Ma suite qui fait pas grand chose
...  suite de la doc
...  suite 2 [image.jpg|${CURDIR}/tto_1.jpg]

Test Setup    debut de test  # pre condition  pré-requis
#Test Teardown   fin de test  # post condition 
Test Teardown  Run Keyword If Test Failed   reinit env
Suite Setup   debut de suite  #pre condition pour un ensemble de test
Suite Teardown  Run Keyword If Any Tests Failed   fin de suite
#Test Teardown   Run Keyword If Test Failed   Log to console   Ca a planté

#Suite Setup   Log To Console  debut de suite
#Suite Teardown  Log To Console   fin de suite
Library  String
# fichier de resource pour externaliser les mots-clefs
resource  clef.resource
Library  tarif 
#Test Tags   toto
Library  Collections


*** Variables ***
${URL}   http://monsite.com
${BROWSER}     google Chrome
${IPMachine1}  128.01.02.65
@{maliste}   1  2  3   4  2
&{Mon Dict}   animal=canari   nom=titi   type=oiseau
${nom}  toto
${mdp}  titi
${OS}  mac


*** Test Cases ***
evaluation
    ${toto}  Evaluate  "${CURDIR}"==""
    Log To Console   ${toto}
TP1
  [Tags]  regression  critique
  Log to console   Bonjour les amis

TP1_LOG
  log  message  level=ERROR
  log  bonjour  level=WARN
  log  ehfgreg   level=INFO




TP1 Optionnel
  
   [Tags]  robot:skip
    Log  Bonjour les Amis  WARN
    log  Une erreur   ERROR


TP2: test des mot cles
  [Documentation]    cas de test 1
  mot clef simple
  mot clef avec Argument    un mot clef simple
  
TP2-1 : mot clef avec plusieurs arguments et 1 sortie
  ${sortie}   Mot clef complexe  toto  titi
  Log To Console   sortie :${sortie}


TP2-3 valeur optionnelles
   ${sortie}  mot clef avec Arguments   machin
   Log To Console  ${sortie}
   ${sortie}  mot clef avec Arguments   machin  tutu
   Log To Console  ${sortie}

TP2-4 liste de valeurs en sortie
  ${S1}  ${S2}  mot clef qui retourne plusieurs valeurs
  log to console  sortie1:${S1} sortie2:${S2}
  # sera vu plus tard
  @{listeLocale}  mot clef qui retourne plusieurs valeurs
  FOR  ${elt}  IN  @{listeLocale}
     Log To Console  ${elt}
  END


TP3 test variable globale
  
  [Tags]   globale
  Log To Console  site à tester: ${URL}
  Log To Console  site à tester: ${BROWSER}
  Log To Console   ${maListe}[1]
  Log To Console  ma liste @{maliste}
  Log To Console  Mon ${Mon Dict}[animal] s'appele ${Mon Dict}[nom]
  Log To Console  ${Mon Dict.animal}
  Set List Value  ${maliste}  1  toto
  Log To Console   ${maListe}[1]
test dhizeuf
  [Tags]   globale
  Log To Console   ${maListe}[1]

TP3-bis test variable globale
  [Tags]  Regression
  Set Test Variable  ${URL}  http://toto.com
  Log To Console  site à tester: ${URL}

TP3-ter
    [Tags]  Regression
  Log To Console  site à tester: ${URL}

TP3-Bis Optionnel déclaration variable locale au test
#   set test variable  ${locale}   truc muche
   VAR    ${locale}    truc muche
   Set Global Variable   ${locale}

TP3-Bis Optionnel utilisation variable
   Log To Console   ${locale}

TP3-1: Affichage repertoire
  Log To Console  repertoire exec:${\n}${EXECDIR}
  Log To Console  repertoire courant:${\n}${CURDIR}
  Log To Console  ${\n}${TEMPDIR}

TP3-2 variable predefinies
  #[Tags]  robot:continue-on-failure   #sera vu plus tard
  log to console   bonjour${SPACE}${SPACE}toto
  Should Be Equal As Integers  80  ${80}
#  should be Equal   80  ${80}  msg=echec 
#  Should Be Equal  ${80}   80
  log to console   mon test n'a pas marché
TP3-2 optionnel
# expression python d'ou la presence de guillemets
  log to console  ${PREV_TEST_STATUS}
  skip if  "${PREV_TEST_STATUS}" == "FAIL" 
TP3-2 affichage du statut du test précédent

  log to console   statut du test précédent:${PREV_TEST_STATUS}

TP6 BDD
  Given log to Console  ${\n}un individu
  When Log to Console   il fait qqch
  Then Log To Console   Il se passe qqch  

# Pour chaque ${elt} dans la @{maliste}
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



TP11
  log   os:${OS}  INFO
Creation de list
  @{liste}  Split String  il-fait-beau  separator=-
  
test concatenation 3
  ${resultat}  Catenate  SEPARATOR=_   toto   titi
  Should Be Equal  ${resultat}  toto_titi

test concatenation 1
   ${ret}  concatenation  Bonjour   Monsieur
   Should Be Equal  ${ret}  Bonjour-Monsieur

test concatenation 2
   ${ret}  concatenation  Bonjour   Madame
   Should Be Equal  ${ret}  Bonjour-Madame

TP8: test concatenation 3
   ${ret}  concatenation  Salut   Madame
   Should Be Equal  ${ret}  Salut-Madame

TP9: Test concatenation multiples
  [Template]  modele concatenation
  Bonjour  Monsieur  Bonjour_Monsieur
  aurevoir  Machin  aurevoir_Machin
  Bonjour  madame   Bonjour_madame
  aurevoir  toto  aurevoir_toto


nombres au hasard
   Repeat Keyword    5 times   nombre au hasard


nombre entre 1 et 10
  [Tags]  robot:skip
  ${toto}   nombre au hasard
  # expression python
  IF  ${toto} > 5 
    Log to console   superieur à 5
  END

test du modele
  [Template]  Modele
  Bonjour  Monsieur   Bonjour Monsieur
   Bonjour  Madame   Bonjour Madame 
*** Keywords ***

modele concatenation 
   [Arguments]  ${ent1}   ${ent2}   ${sortie}
   ${ret}  Catenate  SEPARATOR=_  ${ent1}   ${ent2}
   Should Be Equal  ${ret}  ${sortie}
# TP
mot clef simple
  [Documentation]   CECI EST UN MOT CLEF
  Log To Console  toto
  Log To Console  titi
mot clef avec Argument
  [Documentation]    CECI EST UN MOT CLEF
  [Arguments]  ${toto} 
  Log To Console  ${toto} 
# TP2
mot clef avec Arguments
  [Documentation]    CECI EST UN MOT CLEF
  [Arguments]  ${toto}  ${opt}=titi
  RETURN   j'affiche ${toto} ${opt}   
# TP2
mot clef qui retourne plusieurs valeurs
   RETURN  val1   val2
Mot clef complexe
  [Documentation]   ceci est un mot cle propriétaire
  [Arguments]  ${arg1}   ${arg2}
  Log To Console  ${arg1}
  Log To Console  ${arg2}
  RETURN  ${arg1} 
afficher ${prenon} ${nom}
  Log To Console   ${prenon}
  Log To Console   ${nom}

#TP4
fin de test
   log to console   ${\n}status du test:${TEST_STATUS}
   Log To Console  fermeture de la lisaon serie
   Run Keyword If Test Passed  log to console   ${\n}le test est passé HOURRA!
debut de test
    Log To Console  ${\n}debut du test: ${TEST_NAME}
    Log To Console  initialisation de la liaison serie
debut de suite
   log to console   ${\n}debut de la suite
   &{proxy}    Create Dictionary   nom=${nom}  motdepasse=${mdp}
fin de suite
  Log To Console   ${\n}fin de la suite
nombre au hasard    
    ${random} =	Evaluate	random.randint(0, 10)
    log to console  ${random}
    RETURN  ${random}
concatenation
   [Arguments]  ${var1}  ${var2}
   ${sortie}   catenate  SEPARATOR=-  ${var1}  ${var2}
   RETURN  ${sortie}

Modele
   [Arguments]  ${var1}  ${var2}  ${var3}
   ${ret}  catenate  ${var1}   ${var2}
   Should Be Equal  ${ret}  ${var3}
reinit env
  Log To Console   REINIT ENV


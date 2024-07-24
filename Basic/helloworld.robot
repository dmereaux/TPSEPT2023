*** Settings ***
Documentation  de la doc de suite
...  suite de la doc
Library  String
Resource   ${CURDIR}/clef.resource
Suite Setup   gestion suite de test
Test Teardown  Run Keyword If Test Failed   gestion en cas d'erreur
*** Variables ***
${IP}   127.0.0.1
${FIRMWARE}   12.0.8
${toto}   %{PATH}
@{liste1}   1  2  3
&{dictionnaire}   animal=chien   nom=médor    
*** Test Cases ***
afficher Variables 
  [Teardown]  
  log  toto level=WARN  html=True
  Log To Console  ${\n}liste:${liste1}[0]
  Log To Console  ${\n}dict:${dictionnaire}[animal]
  @{l}  Split String  il neige
  Log To Console  ${\n}liste:${l}[0]
  @{maliste}   Create List   @{l}
  Log To Console  ${\n}liste:${maliste}[0]
  Set Global Variable  @{maliste}
afficher liste1
  FOR  ${elt}   IN  @{liste1}
    Log To Console  ${\n}valeur: ${elt}
  END
test du if
  IF   "${PREV_TEST_STATUS}" == "PASS"
     Log To Console   le test précédent est OK
  END
vérif platform
  ${ret}   evaluate  platform.system()
  Log To Console   ${ret}
  IF   platform.system() == 'Linux'
      Log To Console  ce n'est pas la bonne plateforme
  END
afficher variable 2
  Log To Console  ${\n}liste:${maliste}[0]
afficher les constantes
  Log To Console  ${\n}IP:${IP},firmware:${FIRMWARE}
Helloworld
  [Tags]   regression   toto titi  world
  [Documentation]   doc de test
  Log To Console  Bonjour
  mon premier mot cle
hello
  ${toto}  mot clef  hello   world
  Log To Console   ${toto}
  ${toto}  mot clef  hello   
  Log To Console   ${toto}
  Set Tags  ${toto}
  [Tags]  ${toto}

afficher variables prédéfinies
   Log To Console  ${\n}${CURDIR},${\n}${TEMPDIR},${\n}${EXECDIR}
Comparer un entier avec une chaine
   Should Be Equal As Integers  80  ${80}
#   Should be equal  80  ${80}
   Log To Console   le ttest ne s'est pas arreté
   Log To Console   ${\n}staut:${PREV_TEST_STATUS}
test skippé
  SKIP IF  "${PREV_TEST_STATUS}" == "FAIL"
modele 
  [Template]  Comparer un entier avec une chaine 2
   80  ${80}
   90  ${90}
test valeur inf à 10
   ${x}   valeur inferieure à 10
   Should Be True    ${x} < 11

*** Keywords ***
mon premier mot cle
  Log to console  j'ai créé un mot clé



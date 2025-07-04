*** Settings ***
Library  Dialogs
Library	Screenshot	 screenshot_module=wxpython
Library  String
Library   OperatingSystem
Suite Setup   creation repertoire
*** Variables ***
${PWD}   ${EMPTY}


*** Test Cases ***


TP2: essai 
  Execute Manual Step   verifier   message error
  Take Screenshot   ${EXECDIR}/toto

TP3: essai 
  Execute Manual Step   verifier   message error
  Set Screenshot Directory  ${CURDIR}
  Take Screenshot  tto


TP2: recuperer
   Set Log Level  WARN
   ${x}   Get Value From User   mot de passe   hidden=True
   Reset Log Level

TP2-Optionnel essai 2
  @{users} =	Get Selections From User	Select users	user1	user2	admin
  FOR  ${elt}  IN  @{users}
      Log To Console  ${elt}
  END

TP4 décomposer une chaine de caractères
  @{mots}  Split String   Il etait une fois
  FOR  ${elt}  IN  @{mots}
     Log to console  ${\n} mot:${elt}
  END
TP4_optionnel
  @{mots}  Split String   Il etait une fois  max_split=2
  FOR  ${elt}  IN  @{mots} 
     Log to console  ${\n} mot:${elt}
  END
TEST1
  Saisie Mot de passe
#TP4 optionnel
TEST DU MOT
  ${toto}  mot de 4 lettres
  Should Be String  ${toto}
essai Timeout
  [Timeout]   4
  sleep   5s
*** Keywords ***
#TP3
creation repertoire
   Create Directory   ${EXECDIR}/screenshots
   Set Screenshot Directory   ${EXECDIR}/screenshots

Saisie Mot de passe
   IF  "${PWD}"==""
       ${PWD}  Get Value From User   saisie du mot de passe
   END
#TP4 optionnel
mot de 4 lettres
   ${mot}  Generate Random String  4  [LETTERS]
   RETURN   ${mot}
   
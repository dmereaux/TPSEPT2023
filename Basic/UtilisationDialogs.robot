*** Settings ***
Library  Dialogs
Library	Screenshot	 screenshot_module=PIL
Library  String
Library   OperatingSystem
Suite Setup   creation repertoire
*** Variables ***
${PWD}   ${EMPTY}


*** Test Cases ***

au hasard
  ${x}  Generate Random String  1  [NUMBERS]
  Log To Console  ${x}
TP2: essai 
  [Timeout]   4
  Execute Manual Step   verifier   message error

TP3: essai 
  [Timeout]   4
  Execute Manual Step   verifier   message error
  Take Screenshot  tto
essai Timeout
  [Timeout]   4
  sleep   5s

TP2: recuperer
   ${x}   Get Value From User   nom
   Log To Console    ${x} 
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
*** Keywords ***
#TP3
creation repertoire
   Create Directory   ${EXECDIR}/screenshots
   Set Screenshot Directory   ${EXECDIR}/screenshots

Saisie Mot de passe
   IF  "${PWD}"==""
       ${PWD}  Get Value From User   saisie du mot de passe
   END
   
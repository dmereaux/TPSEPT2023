*** Settings ***
Library  Dialogs
Library	Screenshot	screenshot_module=PIL
Library  String
Library   OperatingSystem
Suite Setup   creation repertoire


*** Test Cases ***
toto
   Take Screenshot  essai
au hasard
  ${x}  Generate Random String  1  [NUMBERS]
  Log To Console  ${x}
essai 
  [Timeout]   4
  Execute Manual Step   verifier   message error
  Take Screenshot  tto
essai Timeout
  [Timeout]   4
  sleep   5s

recuoperer
   ${x}   Get Value From User   nom
   Log To Console    ${x} 
essai 2
  @{users} =	Get Selections From User	Select users	user1	user2	admin
  FOR  ${elt}  IN  @{users}
      Log To Console  ${elt}
  END
  Take Screenshot  toto
*** Keywords ***
creation repertoire
   Create Directory   ${EXECDIR}/screenshots
   Set Screenshot Directory   ${EXECDIR}/screenshots
   
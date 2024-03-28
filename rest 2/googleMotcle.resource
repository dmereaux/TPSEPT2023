*** Settings ***
Library  RequestsLibrary
Library  XML

*** Variables ***
${GOOGLEENDPOINT}   http://maps.googleapis.com
${requete}   /maps/api/geocode/xml
&{params}  address=92120,FR sensor=false
 

*** Keywords ***
Ouvrir session
   Create Session   google   ${GOOGLEENDPOINT}  disable_warnings=${True}
fermer session
   Delete All Sessions
Faire une requete
   ${resp}  Get on session  google  ${requete}  params=&{params}
   Log To Console  ${resp.content}
   ${structXML}   Parse Xml   ${resp.content}
   Log To Console   ${structXML}
   Element Text Should Be  ${structXML}   REQUEST_DENIED   status
   @{liste}   Get Elements Texts   ${structXML}  *
   FOR  ${elt}  IN  @{liste}
      Log To Console   ${elt}
    END
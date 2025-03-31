

*** Test Cases ***
test bonjour
  
  Log To Console  Hello World!
  mon keyword bonjour

test 2
  ${locale}  afficher  aurevoir
  Log To Console  ${locale}
*** Keywords ***
mon keyword bonjour
  Log To Console  Bonjour2
afficher
  [Arguments]  ${item}  
  Log To Console  ${item}
  RETURN  tout va bien:${item}


*** Test Cases ***
test bonjour
  Log To Console    Hello World!
test 2
  ${locale}  afficher  aurevoir
  Log To Console  ${locale}
*** Keywords ***
afficher
  [Arguments]  ${item}  
  Log To Console  ${item}
  RETURN  tout va bien:${item}
*** Settings ***
Library  calculette.py
*** Variables ***
${VINGT}   20
@{NOTES}    10  10  13
&{NOTES CLASSE}   nom=Matthieu   note=20
*** Test Cases ***
TP1_LOG
  log  message  level=ERROR
  log  bonjour  level=WARN
  log  ehfgreg   level=INFO
TP1_TEST
  ${res}  Addition  2  3
  Should Be Equal As Integers  5  ${res}

TP2
  ${res}  PLUS 10   2
  Should Be Equal As Integers   ${res}   12
  ${res}  PLUS 20   
  Should Be Equal As Integers   ${res}   22
TP3
  ${res}   Addition   3   ${VINGT}
   Should Be Equal As Integers   ${res}   23
   ${moyenne de la classe}   moyenne  @{NOTES}
   Should Be Equal As Integers   ${moyenne de la classe}    11
  
 


*** Keywords ***
PLUS 10
  [Arguments]   ${x}
  ${res}  Addition  ${x}  10
  RETURN  ${res}

PLUS 20
  [Arguments]   ${x}=2
  ${res}  Addition  ${x}  20
  RETURN  ${res}


  
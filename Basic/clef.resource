
*** Keywords ***
Comparer un entier avec une chaine 2
  [Arguments]   ${arg1}  ${arg2}
   Should Be Equal As Integers  ${arg1}  ${arg2}
mot clef
  [Documentation]   documentation mot clef
  [Arguments]  ${arg1}   ${arg2}=toto
  ${ret}  Catenate  SEPARATOR=-  ${arg1}   ${arg2}
  log  msg  level=WARN
  RETURN  ${ret}

gestion fin de test
   Log To Console   ${\n}status:${TEST_STATUS}

gestion suite de test
    log to console   charger la config
    log to console   initialiser le matériel
gestion en cas d'erreur
   log to console    remettre la plateforme en état
valeur inferieure à 10
    ${random}  	Evaluate 	random.randint(0, 10)
    RETURN   ${random}


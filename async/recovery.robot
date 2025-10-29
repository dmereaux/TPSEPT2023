*** Settings ***
Test Setup    deb
Test Teardown  fin

*** Test Cases ***
Test1 
    Fail    Erreur systeme

Test2
    Pass Execution  ok

Test3
    Fail    Erreur SUT



*** Keywords ***
deb
    Log To Console   verifier systeme OK
    Log To Console   Début du test
fin
    Log To Console   Fin du test
    Run Keyword If Test Failed    recovery
recovery
    IF  "${TEST_MESSAGE}" == "Erreur SUT"
        Log To Console   Récupération après erreur SUT

    ELSE IF  "${TEST_MESSAGE}" == "Erreur systeme"
        Log To Console   Récupération après erreur système
        Set Test Message    PB
    END
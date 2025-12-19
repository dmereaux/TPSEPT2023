*** Settings ***
Test Setup    Setup System
Test Teardown  Teardown Test

*** Test Cases ***
Test1 
    [Documentation]    Test avec une erreur systeme
    [Tags]     test:retry(2)
    Log To Console   Execution du Test1
    Should Be Equal  2  3    Erreur systeme

Test2
    [Documentation]    Test qui passe correctement
    [Tags]    recovery
    Pass Execution  ok

Test3
    [Documentation]    Test avec une erreur SUT
    [Tags]    recovery  
    Run Keyword And Continue On Failure   Fail    Erreur SUT



*** Keywords ***
Setup System
    Log To Console   verifier systeme OK
    Log To Console   Début du test
Teardown Test
    Log To Console   Fin du test
    Run Keyword If Test Failed    Recovery
Recovery

    IF  "${TEST_MESSAGE}" == "Erreur SUT"
        Log To Console   Récupération après erreur SUT

    ELSE IF  "${TEST_MESSAGE}" == "Erreur systeme"
        Log To Console   Récupération après erreur système
        Set Test Message    PB
    END
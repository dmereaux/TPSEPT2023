*** Settings ***
Test Setup    Ouvrir Application
Test Teardown    Fermer Application
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${BROWSER}    gc
#${CHROME_OPTIONS}    add_argument("--user-data-dir=/tmp/chrome_profile_rob")
${LOC_NOMBRE_RESULTAT}    xpath://*[@id="js-product-list-top"]/div[1]/p


*** Keywords ***
Ouvrir Application
    Open Browser    ${URL}    ${BROWSER}    #options=${CHROME_OPTIONS}
    Log To Console    "setup"

Fermer Application
    Close Browser
    Log To Console    "teardown"

Saisir Recherche
    [Arguments]    ${texte_recherche}
    Wait Until Element Is Visible    css:input[name="s"]
    Input Text    css:input[name="s"]    ${texte_recherche}
    Press Keys    css:input[name="s"]    RETURN
    Wait For Condition    return document.title == "Rechercher"    timeout=5

Verifier Nombre Resultat Recherche Egal
    [Arguments]    ${nombre_attendu}
    Wait Until Element Is Visible    ${LOC_NOMBRE_RESULTAT}
    ${texte_resultat} =    Get Text    ${LOC_NOMBRE_RESULTAT}
    Should Match    ${texte_resultat}    Il y a ${nombre_attendu} produit*

Modele Recherche
    [Arguments]    ${texte_recherche}    ${nombre_attendu}
    Saisir Recherche    ${texte_recherche}
    Sleep    1
    Verifier Nombre Resultat Recherche Egal    ${nombre_attendu}

Verifier Menu Homme Visible
    Element Should Be Visible    xpath://*[@id="category-4"]/a

Verifier Menu Homme Non Visible
    Element Should Not Be Visible    xpath://*[@id="category-4"]/a

Survoler Menu Vetements
    Mouse Over    xpath://*[@id="category-3"]
    Sleep    0.5
    
Arret Survoler Menu Vetements
#   Normalement il faudrait utiliser Mouse Out mais bizarrement cela ne fonctionne pas
    Mouse Over    xpath://*[@id="content"]/section[1]/h2[1]
    Sleep    0.5


*** Test Cases ***
Test Title
    Title Should Be    monPrestashop

# Test Recherche Mug
#     Saisir Recherche    mug
#     Page overShould Contain    mug
#     Verifier Nombre Resultat Recherche Egal    5

Test Menu Homme
    Verifier Menu Homme Non Visible
    Survoler Menu Vetements
    Verifier Menu Homme Visible
    Arret Survoler Menu Vetements
    Verifier Menu Homme Non Visible

# Recherche Diverses
#     [Template]    Modele Recherche
#     mug    5
#     MUG    5
#     Coussin    3
#     T-Shirt    1


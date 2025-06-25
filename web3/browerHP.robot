*** Settings ***
Test Setup   Ouvrir Application
Test Teardown   Fermer Application
Library   SeleniumLibrary

*** Variables ***
${BROWSER}   firefox
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${SEARCH_INPUT}    //*[@id="search_widget"]/form/input[2]
${SEARCH_TERM}    mug    # Terme à rechercher
${RESULTS_TEXT}    //*[@id="js-product-list-top"]/div[1]/p

${MENU_VETEMENTS}    //*[@id="category-3"]/a
${MENU_HOMME}    //*[@id="category-4"]/a


*** Keywords ***
Ouvrir Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fermer Application
    Close Browser

Rechercher Produit
    [Arguments]    ${terme}
    Input Text    ${SEARCH_INPUT}    ${terme}
    Press Keys    ${SEARCH_INPUT}    RETURN
    Wait For Condition  return document.title == "Rechercher"  10

Verifier Menu Homme Non Visible
    Element Should Not Be Visible    ${MENU_HOMME}

Survoler Menu Vetements
    Mouse Over    ${MENU_VETEMENTS}

Verifier Menu Homme Visible
    Wait Until Element Is Visible    ${MENU_HOMME}    5s

Verification Nombre Produits
    [Arguments]    ${RESULTS_TEXT}   ${msg}   
    Wait Until Element Is Visible    ${RESULTS_TEXT}
    Element Text Should Be    ${RESULTS_TEXT}  ${msg}

Modele Recherche Produit
    [Arguments]    ${item}   ${msg}
    Rechercher Produit    ${item}
    Verification Nombre Produits    ${RESULTS_TEXT}  ${msg}

*** Test Cases ***
Test Navigation Site
    Title Should Be    monPrestashop
    Rechercher Produit    ${SEARCH_TERM}
    Verification Nombre Produits    ${RESULTS_TEXT}   Il y a 5 produits.

Test Modele
    Modele Recherche Produit    mug   msg=Il y a 5 produits.

Test Modele Avec Jeux D’Essai
    [Template]    Modele Recherche Produit
    mug    Il y a 5 produits.
    t-shirt    Il y a 1 produit.
    affiche    Il y a 4 produits.

Test Affichage Menu Homme
    Verifier Menu Homme Non Visible
    Survoler Menu Vetements
    Verifier Menu Homme Visible
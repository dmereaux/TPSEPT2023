*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL CONNEXION}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php?controller=authentication?back=http%3A%2F%2Fwww.qualifiez.fr%2FmonPrestashop2%2Fprestashop%2Findex.php%3Fcontroller%3Dauthentication%3Fback%3Dhttp%253A%252F%252Fwww.qualifiez.fr%252FmonPrestashop2%252Fprestashop%252Findex.php%253Fcontroller%253Dsearch%2526s%253DMUG
${MESSAGE ERREUR CONNEXION}   Échec d'authentification
${LOC_MESSAGE_ERREUR CONNEXION}   //*[@id="content"]/section/div/ul/li
${LOC_CHAMP_EMAIL}   id=field-email
${LOC_CHAMP_MDP}   id=field-password
${LOC_BOUTON_CONNEXION}   id=submit-login
*** Keywords ***
je suis sur la page de connexion
    go to  ${URL CONNEXION}

je m’authentifie avec le login ${mail} et mdp ${mdp} 
    Wait Until Element Is Visible   ${LOC_CHAMP_EMAIL}
    Input Text   ${LOC_CHAMP_EMAIL}   ${mail}
    Input Text   ${LOC_CHAMP_MDP}   ${mdp}
    Click Button   ${LOC_BOUTON_CONNEXION}

je vois le message suivant 
    [Arguments]   ${msg}
    Element Text Should Be     ${LOC_MESSAGE_ERREUR CONNEXION}   ${msg}

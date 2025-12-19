*** Settings ***
Resource  motClefPresta.resource
Resource  connexion.resource
Test Setup    Ouvrir Prestashop
Test Teardown   Fermer Prestashop

*** Test Cases ***
test connexion valide
	Given je suis sur la page de connexion  
	When je m’authentifie avec le login dominique.mer@qualifiez.fr et mdp yyyryduytfftyfuyft
	Then je vois le message suivant     ${MESSAGE ERREUR CONNEXION}

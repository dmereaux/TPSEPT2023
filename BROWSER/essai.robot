*** Settings ***
Library   Browser    strict=False

*** Variables ***
${toto}      un
*** Test Cases ***
Example Test
    New Browser   chromium  False
    New Page    http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
    Get Title    ==    monPrestashop
    Click    text=Contactez-nous
    Close Browser


 


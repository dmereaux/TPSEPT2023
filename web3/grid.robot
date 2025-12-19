*** Settings ***
#Library   ma_lib_selenium.py
Library   SeleniumLibrary   #implicit_wait=5
*** Variables ***
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${URL2}  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert
${URL3}  https://cfspart-idp.impots.gouv.fr/oauth2/authorize?authType=sso&prompt=login&scope=openid+profile+authChoice+otpEscape&state=e56d820faa8d0e29b4ea20ec31f4fff31a31ed68fb7207b51e276b5b05d7897b&client_id=52ed02940b0f1c57512f2d6fd064dddffccdea03&nonce=dmbQc1hq2bxRhDDGmg5NYg&response_type=code&redirect_uri=https%3A%2F%2Fcfspart.impots.gouv.fr%2F%3Fopenidconnectcallback%3D1
${NAVIGATEUR}     GC
${PATH_GC}   /Users/dominiquemereaux/code/driver/chromedriver
${LOC_CHAMP_RECHERCHE}   xpath=//*[@id="search_widget"]/form/input[2]
${LOC_NOMBRE_RESULTATS}   //*[@id="js-product-list-top"]/div[1]/p
${LOC_LIEN_RECHERCHE}   //*[@id="js-product-list"]//article/div/div[2]/h2/a
${LOC_ICONE}   //*[@id="_desktop_logo"]//a/img
${LOC_MESSAGE_ERREUR}   //*[@id="product-search-no-matches"]
${MESSAGE ERREUR}   Aucun produit ne correspond à votre recherche
${LOC_checkbox}    //*[@id="search_filters"]/section/ul/li[1]/label/span/input
${LOC_MENU_VETEMENT}  //*[@id="category-3"]/a
${LOC_MENU_FEMMES}   //*[@id="category-5"]/a
${LOC_CONTINUER}    id=btnAction
&{capa}   "platformName"="Android"  browserName=chrome  platformVersion=16  platformName=Android  appium:chromedriverExecutable=${PATH_GC}    appium:automationName=UiAutomator2

*** Test Cases ***
test
  Open Browser      ${URL}  ${NAVIGATEUR}     remote_url=http://localhost:4723
    Title Should Be  monPrestashop
    Close Browser
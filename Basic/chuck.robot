*** Settings ***                                                                                       
                                                                              
Library    RequestsLibrary                                                                             
                                                                                                       
Suite Setup    Create Session  chuck  https://api.chucknorris.io/                   
                                                                                                       
*** Test Cases ***                                                                                     
                                                                                                       
Get Request Test                                                                                       
   ${resp_json}=     GET On Session  chuck  jokes/random    params=category=food                                                                                                                                         
    Log To Console      ${resp_json.json()}[value]      
test 2
  ${blague}  recuperer blague de categorie:   animal
  Should Contain      ${blague}  chuck  ignore_case=True
 
*** Keywords ***
recuperer blague de categorie:
  [Arguments]  ${categorie}
  ${resp_json}=     GET On Session  chuck  jokes/random    params=category=${categorie}                                                                                                                                        
  RETURN  ${resp_json.json()}[value]
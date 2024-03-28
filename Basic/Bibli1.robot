*** Settings ***
Documentation   Ma suite qui fait pas grand chose
Library  LibCalcul.MaLibrairie  

*** Test Cases ***
Util LibCalcul
  ${x}  Calcul Tarif   20
  Should Be Equal  ${x}  plein tarif
Util plusieurs arguments
   any_arguments   un   deux  trois
skkipy 
    Example Keyword
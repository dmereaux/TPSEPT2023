*** Settings ***
Library   DatabaseLibrary
*** Test Cases ***

toto
  Connect To Database  db_module=pymysql  db_name=mysql  user=root
  ${resp}  Query     SELECT * from db where Host='localhost'  return_dict=${True} 

  Log To Console  ${resp} 
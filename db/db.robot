*** Settings ***
Library   DatabaseLibrary
*** Test Cases ***

toto
  Connect To Database   db_module=pymysql  db_name=mysql   db_user=root     db_password=root  db_host=localhost  
  ${resp}  Query     SELECT * from db where Host='localhost'  return_dict=${True} 

  Log To Console  ${resp} 
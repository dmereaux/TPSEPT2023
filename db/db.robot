*** Settings ***
Library   DatabaseLibrary
*** Test Cases ***
# lancer MAMP
toto
  Connect To Database   db_module=pymysql  db_name=mysql   db_user=root     db_password=root  db_host=localhost  port=${8889}
  ${resp}  Query     SELECT * from db where Host='localhost'  return_dict=${True} 
  Log To Console  ${resp} 
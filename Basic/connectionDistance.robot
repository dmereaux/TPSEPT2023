*** Settings ***
Library    SSHLibrary

*** Test Cases ***
Test
  Open Connection   home233633473.1and1-data.host  port=22
  Login    u48143663   1ForMaTion!
  ${stdout}=	Execute Command	echo 'Hello John!'
  Log To Console  resultat:${stdout}
  Should Contain	${stdout}	Hello John!
  ${stdout}=	Execute Command	ls
  Log To Console  ${stdout}

*** Settings ***
Library           SoapLibrary
Library           OperatingSystem

*** Test Cases ***
Example
    Create Soap Client    http://www.dneonline.com/calculator.asmx?wsdl
    ${response}    Call SOAP Method   Add   2  3
    Log to Console   ${response}
    Should Not Be Equal As Integers  ${response}  5

*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${Base_URL}    http://thetestingworldapi.com/


*** Test Cases ***
TC_001_GetRequest
    create session  Get_AdAnalytics  ${Base_URL}
    ${response}=   GET On Session    Get_AdAnalytics    api/studentsDetails
    log to console  ${response.status_code}
    log to console  ${response.content}





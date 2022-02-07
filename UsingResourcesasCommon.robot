*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    Resources/GetAccessToken.robot

*** Variables ***
${rel_uri}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00075

*** Test Cases ***
TC_002_GetAdRequest
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${rel_uri}
    log to console  ${response.status_code}
    log to console  ${response.content}
    # Data Validation from Json Response
    ${json_object}=    to json    ${response.content}
    ${interval}=    get value from json    ${json_object}    $.dateRange.interval
    log to console    ${interval[0]}
    should be equal  ${interval[0]}    DAILY


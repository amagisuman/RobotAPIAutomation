*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${Base_URL}    https://api-analytics.amagi.tv/
${rel_uri}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00075

*** Test Cases ***
TC_002_GetAdRequest
    Get Access Token With Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${rel_uri}
    log to console  ${response.status_code}
    log to console  ${response.content}
    # Data Validation from Json Response
    ${json_object}=    to json    ${response.content}
    ${interval}=    get value from json    ${json_object}    $.dateRange.interval
    log to console    ${interval[0]}
    should be equal  ${interval[0]}    DAILY


*** Keywords ***
Get Access Token With Base URL
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetAdAnalytics    ${Base_URL}    headers=${access_token}

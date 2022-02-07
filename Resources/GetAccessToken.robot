*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base_URL}    https://api-analytics.amagi.tv/
${rel_uri}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00075

*** Keywords ***
Get Access Token with Base URL
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetAdAnalytics    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for AdContentAnalytics
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetAdContentAnalytics    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for ConcurrentUsers
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetConcurrentUsers    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for Daily ContentAnalytics
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetDailyContentAnalytics   ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for Hourly ContentAnalytics
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetHourlyContentAnalytics    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for Daily ViewershipAnalytics
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetDailyViewership    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for Hourly ViewershipAnalytics
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetHourlyViewership    ${Base_URL}    headers=${access_token}

Get Access Token with Base URL for UniqueViewers
    ${access_token}=    Create Dictionary    x-access-token=ab10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetUniqueViewers    ${Base_URL}    headers=${access_token}
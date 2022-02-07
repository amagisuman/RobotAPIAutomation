*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../../../Resources/GetAccessToken.robot

*** Variables ***
${customer}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&customerId=AMG00432
${channel}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&channelId=amg00432-circle-circle-rokuus

${customer_channel}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&channelId=amg00432-circle-circle-rokuus&customerId=AMG00432
${channel_timezone}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&channelId=amg00432-circle-circle-rokuus&timezone=US/Pacific

${customer_timezone}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&customerId=AMG00432&timezone=US/Pacific
${customer_channel_timezone}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&customerId=AMG00432&timezone=US/Pacific&channelId=amg00432-circle-circle-rokuus

${customer_channel_NotPassed}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&timezone=US/Pacific
${invalid_token}    api/v2?type=uniqueViewersAnalytics&startDate=2021-10-10&endDate=2021-10-16&interval=WEEKLY&channelId=amg00432-circle-circle-rokuus&customerId=AMG00432


*** Test Cases ***
FilterUsing-DateRange_CustomerId
    [Tags]    Sanity
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers   ${customer}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_ChannelId
    [Tags]    Smoke
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers    ${channel}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_ChannelId
    [Tags]    Sanity
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers    ${customer_channel}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Timezone
    [Tags]    Sanity
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers    ${channel_timezone}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Timezone
    [Tags]    Sanity
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers    ${customer_timezone}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_ChannelId_NotPassed
    [Tags]    Sanity
    Get Access Token with Base URL for UniqueViewers
    ${response}=   GET On Session    GetUniqueViewers    ${customer_channel_NotPassed}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_InvalidToken
    [Tags]    Sanity
    ${access_token}=    Create Dictionary    x-access-token=cd10a1c3-d1d6-477a-83bb-dc42cf167e62
    create session  GetUniqueViewers    ${Base_URL}    headers=${access_token}
    ${response}=   GET On Session    GetUniqueViewers    ${invalid_token}
    log to console  ${response.status_code}
    log to console  ${response.content}

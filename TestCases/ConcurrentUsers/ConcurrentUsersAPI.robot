*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../../Resources/GetAccessToken.robot

*** Variables ***
${customer_1Hr}    api/v2?type=concurrentUsers&hoursLimit=1&customerId=AMG00075
${channel_1Hr}    api/v2?type=concurrentUsers&hoursLimit=1&channelId=amg00491-fandango-rottentomatoesroku-rokuus

${customer_12Hr}    api/v2?type=concurrentUsers&hoursLimit=12&customerId=AMG00075
${channel_12Hr}    api/v2?type=concurrentUsers&hoursLimit=1&channelId=amg00491-fandango-rottentomatoesroku-rokuus

${customer_24Hr}    api/v2?type=concurrentUsers&hoursLimit=24&customerId=AMG00075
${channel_24Hr}    api/v2?type=concurrentUsers&hoursLimit=1&channelId=amg00491-fandango-rottentomatoesroku-rokuus


*** Test Cases ***
FilterUsing-CustomerId_HourLimitIs1
    [Tags]    Sanity
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${customer_1Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-ChannelId_HourLimitIs1
    [Tags]    Smoke
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${channel_1Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-CustomerId_HourLimitIs12
    [Tags]    Sanity
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${customer_12Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-ChannelId_HourLimitIs12
    [Tags]    Smoke
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${channel_12Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-CustomerId_HourLimitIs24
    [Tags]    Sanity
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${customer_24Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-ChannelId_HourLimitIs24
    [Tags]    Smoke
    Get Access Token with Base URL for ConcurrentUsers
    ${response}=   GET On Session    GetConcurrentUsers    ${channel_24Hr}
    log to console  ${response.status_code}
    log to console  ${response.content}


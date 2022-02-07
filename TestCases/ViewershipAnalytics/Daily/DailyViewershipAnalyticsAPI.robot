*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../../../Resources/GetAccessToken.robot

*** Variables ***

${customer_content_device_timezone_country_city}    api/v2?type=viewershipAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast
${channel_content_device_timezone_country_city}    api/v2?type=viewershipAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast

${customer_content_device_timezone_country_city_studio}    api/v2?type=viewershipAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm
${channel_content_device_timezone_country_city_studio}    api/v2?type=viewershipAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm


*** Test Cases ***
FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL for Daily ViewershipAnalytics
    ${response}=   GET On Session    GetDailyViewership    ${customer_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL for Daily ViewershipAnalytics
    ${response}=   GET On Session    GetDailyViewership    ${channel_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL for Daily ViewershipAnalytics
    ${response}=   GET On Session    GetDailyViewership    ${customer_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL for Daily ViewershipAnalytics
    ${response}=   GET On Session    GetDailyViewership    ${channel_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

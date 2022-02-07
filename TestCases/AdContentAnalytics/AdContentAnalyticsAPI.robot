*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../../Resources/GetAccessToken.robot

*** Variables ***

${customer_content_device_timezone_country_city}    api/v2?type=adContentAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast
${channel_content_device_timezone_country_city}    api/v2?type=adContentAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast

${customer_content_device_timezone_country_city_studio}    api/v2?type=adContentAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm
${channel_content_device_timezone_country_city_studio}    api/v2?type=adContentAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm

${channel_content_device_timezone_country_city_adtag}     api/v2?type=adContentAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG01412&channelId=amg01546-ftv-fashiontv-xiaomi&country=China&city=Beijing&timezone=US/Pacific&deviceType=Others&deviceName=Others&adTag=SS

*** Test Cases ***
FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL for AdContentAnalytics
    ${response}=   GET On Session    GetAdContentAnalytics    ${customer_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL for AdContentAnalytics
    ${response}=   GET On Session    GetAdContentAnalytics    ${channel_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL for AdContentAnalytics
    ${response}=   GET On Session    GetAdContentAnalytics    ${customer_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL for AdContentAnalytics
    ${response}=   GET On Session    GetAdContentAnalytics    ${channel_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_AdTag_Channel_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL for AdContentAnalytics
    ${response}=   GET On Session    GetAdContentAnalytics    ${channel_content_device_timezone_country_city_adtag}
    log to console  ${response.status_code}
    log to console  ${response.content}
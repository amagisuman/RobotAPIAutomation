*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../../Resources/GetAccessToken.robot

*** Variables ***
${customer}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00075
${channel}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=samsungus-moviesphere-samsung-samsungus&contentId=8000115

${customer_content}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&contentId=contentId&customerId=AMG00075
${channel_content}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1

${customer_studio}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&studioName=grvtywm
${channel_studio}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetvplusxumo&studioName=grvtywm

${customer_timezone}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00491&timezone=US/Eastern
${channel_timezone}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&timezone=US/Eastern

${customer_country}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00491&country=United%20States
${channel_country}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=amg00491-fandango-rottentomatoesroku-rokuus&country=United%20States

${customer_device}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00491&deviceType=Roku
${channel_device}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=whistletv-whistletv-selecttv&deviceType=Smart%20TV

${customer_country_city}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00491&country=United%20States&city=Houston
${channel_country_city}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=amg00491-fandango-rottentomatoesroku-rokuus&country=United%20States&city=Los%20Angeles

${customer_devicetypeName}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00491&deviceType=Desktop&deviceName=Apple%20OS%20X
${channel_devicetyprname}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=whistletv-whistletv-selecttv&deviceType=Smart%20TV

${customer_content_device_timezone_country_city}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast
${channel_content_device_timezone_country_city}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast

${customer_content_device_timezone_country_city_studio}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG00354&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm
${channel_content_device_timezone_country_city_studio}    api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&channelId=outsidetv-outsidetv-vizio&contentId=l2y1uvq1&country=United%20States&city=Anderson&timezone=US/Eastern&deviceType=Smart%20TV&deviceName=Google%20Chromecast&studioName=grvtywm

${channel_content_device_timezone_country_city_adtag}     api/v2?type=adAnalytics&startDate=2021-10-10&endDate=2021-10-21&interval=DAILY&customerId=AMG01412&channelId=amg01546-ftv-fashiontv-xiaomi&country=China&city=Beijing&timezone=US/Pacific&deviceType=Others&deviceName=Others&adTag=SS

*** Test Cases ***
FilterUsing-DateRange_CustomerId
    [Tags]    Sanity
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer}
    log to console  ${response.status_code}
    log to console  ${response.content}
    # Data Validation from Json Response
    ${json_object}=    to json    ${response.content}
    ${interval}=    get value from json    ${json_object}    $.dateRange.interval
    log to console    ${interval[0]}
    should be equal  ${interval[0]}    DAILY

FilterUsing-DateRange_ChannelId
    [Tags]    Smoke
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_ContentId
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_content}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_ContentId
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_content}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_StudioId
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_StudioId
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_StudioId
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Timezone
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_timezone}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Timezone
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_timezone}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Country
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_country}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Country
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_country}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_DeviceType
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_device}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_DeviceType
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_device}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Country_City
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Country_City
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_DeviceType_DeviceName
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_devicetypeName}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_DeviceType_DeviceName
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_devicetyprname}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_content_device_timezone_country_city}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Customer_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${customer_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_Channel_Content_Country_City_Timezone_Device_Studio
    [Tags]    Regression
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_content_device_timezone_country_city_studio}
    log to console  ${response.status_code}
    log to console  ${response.content}

FilterUsing-DateRange_AdTag_Channel_Content_Country_City_Timezone_Device
    [Tags]    Regression
    Get Access Token with Base URL
    ${response}=   GET On Session    GetAdAnalytics    ${channel_content_device_timezone_country_city_adtag}
    log to console  ${response.status_code}
    log to console  ${response.content}
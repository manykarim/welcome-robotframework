*** Settings ***
Library    RequestsLibrary
Library    Collections
Suite Setup    Create Session    booker    url=https://restful-booker.herokuapp.com    headers={"Content-Type":"application/json"}    disable_warnings=True

*** Test Cases ***

Create Booking with JSON string
    ${body} =     Catenate    SEPARATOR=\n
    ...    {
    ...    "firstname" : "Jim",
    ...    "lastname" : "Brown",
    ...    "totalprice" : 111,
    ...    "depositpaid" : true,
    ...    "bookingdates" : {
    ...    "checkin" : "2018-01-01",
    ...    "checkout" : "2019-01-01"
    ...    },
    ...    "additionalneeds" : "Breakfast"
    ...    }
    ${response}    POST On Session    booker    /booking    data=${body} 
    Status Should Be    200

    # Get the ID
    ${id}    Set Variable    ${response.json()}[bookingid]
    ${response}    GET On Session    booker    /booking/${response.json()}[bookingid]
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[lastname]    Brown
    Should Be Equal    ${response.json()}[firstname]    Jim
    Should Be Equal As Numbers    ${response.json()}[totalprice]    111
    Should Be Equal As Strings    ${response.json()}[depositpaid]    True
    Should Be Equal    ${response.json()}[bookingdates][checkin]    2018-01-01
    Should Be Equal    ${response.json()}[bookingdates][checkout]    2019-01-01
    Should Be Equal    ${response.json()}[additionalneeds]    Breakfast


Create a Booking with Robot Framework Dictionary
    ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
    ${body}    Create Dictionary    firstname=Hans    lastname=Gruber    totalprice=200    depositpaid=false    bookingdates=${booking_dates}
    ${response}    POST On Session    booker    /booking    json=${body}
    ${id}    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${id}
    ${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[lastname]    Gruber
    Should Be Equal    ${response.json()}[firstname]    Hans   
    Should Be Equal As Numbers    ${response.json()}[totalprice]    200
    Dictionary Should Contain Value     ${response.json()}    Gruber

Delete Booking
    # Create a booking
    ${body} =     Catenate    SEPARATOR=\n
    ...    {
    ...    "firstname" : "Jim",
    ...    "lastname" : "Brown",
    ...    "totalprice" : 111,
    ...    "depositpaid" : true,
    ...    "bookingdates" : {
    ...    "checkin" : "2018-01-01",
    ...    "checkout" : "2019-01-01"
    ...    },
    ...    "additionalneeds" : "Breakfast"
    ...    }
    ${response}    POST On Session    booker    /booking    data=${body}
    Authenticate as Admin
    ${header}    Create Dictionary    Cookie=token\=${token}
    Create Session    booker_admin    url=https://restful-booker.herokuapp.com    headers=${header}    disable_warnings=True
    # Get the ID
    ${id}    Set Variable    ${response.json()}[bookingid]
    # Delete the booking
    ${response}    DELETE On Session    booker_admin    /booking/${id}
    # Do some assertions
    Status Should Be    201


*** Keywords ***
Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}
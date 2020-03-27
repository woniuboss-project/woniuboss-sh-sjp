*** Settings ***
Library           RequestsLibrary

*** Variables ***
&{headers}        Content-Type=application/json

*** Test Cases ***
woniushoplogin
    ${data}    Create Dictionary    phone=15021122976    password=sabi0609    shop_id=null
    Create Session    session    https://snailpet.com
    ${resp}    Post Request    session    /v2/Passport/login    ${data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.text}
    ${addcustomer}    Set Variable    { \ \ "addr": "", \ \ "cardNumber": "", \ \ "mark": "", \ \ "name": "jtt2", \ \ "pets": [ \ \ \ \ { \ \ \ \ \ \ "birthday": "", \ \ \ \ \ \ "mark": "", \ \ \ \ \ \ "name": "ttj2", \ \ \ \ \ \ "sex": "", \ \ \ \ \ \ "color": "", \ \ \ \ \ \ "weight_new": 0, \ \ \ \ \ \ "speciesId": "" \ \ \ \ } \ \ ], \ \ "phone": "11111111111", \ \ "spare_phone": "", \ \ "sex": "", \ \ "is_spending_msg": 1, \ \ "is_open_upgrade": 1, \ \ "shopId": "17529", \ \ "member_tags": "", \ \ "shop_id": 17529 }
    ${addcresp}    Post Request    session    /v2/Members/add    ${addcustomer}    headers=${headers}
    Log    ${addcresp.text}
    Should Be Equal As Strings    ${addcresp.json()['error']}    1
    ${dicttype}    Create Dictionary    Content-Type=application/x-www-form-urlencoded;charset=UTF-8
    ${addgoods}    Set Variable    shopId=17529&productId=0&barCode=0000585309587&isServer=0&name=%E6%85%A2%E6%85%A2%E6%85%A2&categoryId=839189&inPrice=8&outPrice=88&percentage=0&notice_stocks=1&weight=0&logo_images=&detail_images=&production_time=&brand_name=&version=1&shop_id=17529
    ${addgresp}    Post Request    session    /v2/Product/add    ${addgoods}    headers=${dicttype}
    Log    ${addgresp.text}
    Should Be Equal As Strings    ${addgresp.json()['error']}    1
    ${savetable}    Set Variable    { \ \ "user_id": 27346, \ \ "name": "急急急", \ \ "mark": "", \ \ "shop_id": 17529 }
    ${saveresp}    Post Request    session    /v2/shop/stocktaking/save    ${savetable}    headers=${headers}
    Log    ${saveresp.text}
    Should Be Equal As Strings    ${saveresp.json()['error']}    1

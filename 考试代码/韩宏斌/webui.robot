*** Settings ***
Library           Selenium2Library

*** Test Cases ***
woniubosslogin
    Open Browser    http://192.168.2.106:8080/WoniuBoss2.5/
    Input Text    css=div.row:nth-child(1) > input:nth-child(1)    WNCD000
    Input Password    css=div.row:nth-child(2) > input:nth-child(1)    woniu123
    Click Button    css=.btn
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div[2]/ul/li[2]/a
    Element Should Contain    xpath=/html/body/div[2]/div[2]/ul/li[2]/a    注销
    Close Browser

agonelogin
    Open Browser    http://192.168.2.107/agileone/
    Input Text    id=username    admin
    Input Password    id=password    admin
    Click Button    id=login
    Wait Until Element Is Visible    id=welcome
    Element Should Contain    id=welcome    admin
    Close Browser

woniusales
    Open Browser    http://192.168.2.105:8080/WoniuSales-20180508-V1.4-bin/
    Input Text    id=username    admin
    Input Password    id=password    Milor123
    Input Text    id=verifycode    0000
    Click Button    css=button.form-control
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/div[2]/ul[2]/li[2]/a
    Element Should Contain    xpath=/html/body/div[2]/div/div[2]/ul[2]/li[2]/a    注销
    Input Text    id=barcode    11111111
    Click Button    xpath=/html/body/div[4]/div[1]/div/div[1]/form/button
    Click Button    id=submit
    Alert Should Be Present    确定    确定
    Close Browser

woniushoplogin
    Open Browser    https://snailpet.com/index
    Click Element    css=.red_btn
    Input Text    css=input.cla-tex:nth-child(1)    15021122976
    Input Password    css=input.cla-tex:nth-child(2)    sabi0609
    Click Element    css=.ori-btn
    Wait Until Element Is Visible    xpath=/html/body/app-root/snail-header/div/div/span/a
    Element Should Contain    xpath=/html/body/app-root/snail-header/div/div/span/a    安全退出
    Close Browser

woniushopaddcustomer
    Open Browser    https://snailpet.com/index
    Click Element    css=.red_btn
    Input Text    css=input.cla-tex:nth-child(1)    15021122976
    Input Password    css=input.cla-tex:nth-child(2)    sabi0609
    Click Element    css=.ori-btn
    Wait Until Element Is Visible    css=a.menu_item:nth-child(3) > div:nth-child(3)
    Click Element    css=a.menu_item:nth-child(3) > div:nth-child(3)
    sleep    10
    Click Element    css=div.screen-edit-btn-new:nth-child(7) > a:nth-child(2)
    Input Text    xpath=/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[1]/div[1]/div[1]/div/div/input    jtt
    Input Text    xpath=/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[1]/div[1]/div[2]/div/div/input    15162629341
    Input Text    xpath=/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[2]/ul/li/div[1]/div[1]/div/div/input    ttj
    Click Element    css=div.pop_window:nth-child(1) > div:nth-child(3) > div:nth-child(2)
    sleep    5
    Element Should Contain    css=.body > td:nth-child(10) > a:nth-child(4)    删除
    Close Browser

woniushopaddgoods
    Open Browser    https://snailpet.com/index
    Click Element    css=.red_btn
    Input Text    css=input.cla-tex:nth-child(1)    15021122976
    Input Password    css=input.cla-tex:nth-child(2)    sabi0609
    Click Element    css=.ori-btn    #登录
    Wait Until Element Is Visible    css=a.menu_item:nth-child(4) > div:nth-child(3)    #点击商品管理
    Click Element    css=a.menu_item:nth-child(4) > div:nth-child(3)
    sleep    10
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[2]/div[1]/a[1]    #新增
    sleep    3
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[3]/div[2]/label/input
    Input Text    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[4]/div[1]/div/div/input    快快快
    sleep    3
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[1]
    sleep    3
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[1]/div/div/ul/li[1]
    sleep    3
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[2]
    sleep    3
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[2]/div/div/ul/li[1]
    sleep    3
    Input Text    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[9]/div[1]/div/div/input    5
    Input Text    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[9]/div[2]/div/div/input    55
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[3]/div[2]
    Element Should Contain    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[8]/a[5]/span/span[1]    下架
    Close Browser

woniushopstorge
    Open Browser    https://snailpet.com/index
    Click Element    css=.red_btn
    Input Text    css=input.cla-tex:nth-child(1)    15021122976
    Input Password    css=input.cla-tex:nth-child(2)    sabi0609
    Click Element    css=.ori-btn    #登录
    Wait Until Element Is Visible    css=a.menu_item:nth-child(4) > div:nth-child(3)    #点击商品管理
    Click Element    css=a.menu_item:nth-child(4) > div:nth-child(3)
    sleep    10
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[8]/a[1]
    sleep    5
    Input Text    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[7]/div/div/div[2]/div/div[1]/div/div/input    5
    sleep    5
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[7]/div/div/div[3]/div[2]
    sleep    2
    Element Should Contain    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[7]/a    5
    Close Browser

woniushopoutbound
    Open Browser    https://snailpet.com/index
    Click Element    css=.red_btn
    Input Text    css=input.cla-tex:nth-child(1)    15021122976
    Input Password    css=input.cla-tex:nth-child(2)    sabi0609
    Click Element    css=.ori-btn    #登录
    Wait Until Element Is Visible    css=a.menu_item:nth-child(4) > div:nth-child(3)    #点击商品管理
    Click Element    css=a.menu_item:nth-child(4) > div:nth-child(3)
    sleep    10
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[8]/a[2]
    sleep    8
    Input Text    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[8]/div/div/div[2]/div/div[1]/div/div/input    5
    Click Element    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[8]/div/div/div[3]/div[2]
    sleep    8
    Element Should Contain    xpath=/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[7]/a    0
    Close Browser

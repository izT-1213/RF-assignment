*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${appURL}    https://app.deriv.com/

*** Test Cases ***
Login Deriv
    Open Browser    ${appURL}    chrome
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    
    Input Text    //input[@type='password']    
    Click Element    //button[@type='submit']

Switch to Demo
    Wait Until Page Contains Element    //p[@class="acc-info__balance"]    120
    Wait Until Element Is Visible    //p[@class="acc-info__balance"]    60
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    dt_core_account-switcher_demo-tab    30
    Click Element    dt_core_account-switcher_demo-tab
    Wait Until Page Contains Element    dt_VRTC6751207    20
    Click Element    dt_VRTC6751207
    Maximize Browser Window
    Reload Page

Check Rise Contract Test Value
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Wait Until Element Is Visible    //div[@class='cq-symbol']     30
    Element Should Contain    //div[@class='cq-symbol']   Volatility 100 (1s) Index
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']    60
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Wait Until Element Is Visible    //div[@class='cq-symbol']     30
    Element Should Contain    //div[@class='cq-symbol']   Volatility 10 (1s) Index
    Element Text Should Be    //span[@name='contract_type']    Rise/Fall
    Wait Until Page Contains Element   //button[@class='dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active' and contains(.,'Ticks')]    30
    Element Text Should Be    dt_range_slider_label    5 Ticks
    Element Attribute Value Should Be    //input[@aria-label='Amount']    value    10

Buy contract
    Wait Until Page Contains Element    //button[@class='btn-purchase btn-purchase--1']    60
    Click Button    //button[@class='btn-purchase btn-purchase--1']
    Wait Until Element Is Visible    dt_positions_drawer    60
    Sleep    2
    Element Should Be Visible    //div[@class='dc-contract-card__wrapper']    150
    Close Browser
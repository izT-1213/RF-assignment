*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${appURL}    https://app.deriv.com/

*** Keywords ***
Clear Input Fields
    Press Keys    None    CTRL+a\ue003

Wait cq-symbol
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    120
    Wait Until Element Is Visible    //div[@class='cq-symbol']   120

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

Navigate to Forex AUD/USD
    Wait cq-symbol
    Element Should Contain    //div[@class='cq-symbol']   Volatility 100 (1s) Index
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Element Is Visible    //span[@class='ic-icon ic-forex']    40
    Click Element    //span[@class='ic-icon ic-forex']
    Wait Until Element Is Visible    //span[@class='ic-frx ic-frxAUDUSD']    60
    Click Element    //span[@class='ic-frx ic-frxAUDUSD']
    Wait cq-symbol
    Element Should Contain    //div[@class='cq-symbol']   AUD/USD

Setting up Lower Contract Data
    Wait Until Element Is Visible    dt_contract_dropdown    60
    Click Element    dt_contract_dropdown
    Wait Until Element Is Visible    dt_contract_high_low_item    30
    Click Element    dt_contract_high_low_item
    Wait Until Element Is Visible    dt_advanced_duration_datepicker    20
    Element Should Be Visible    //input[@name='duration']
    Click Element    //input[@name='duration']
    Clear Input Fields
    Input Text    //input[@name='duration']    4
    Element Should Be Visible    dc_payout_toggle_item    30
    Click Element    dc_payout_toggle_item
    Wait Until Element Is Visible    dt_amount_input    120
    Click Element    dt_amount_input
    Clear Input Fields
    Input Text    dt_amount_input    10

Testing barrier
    Element Should Be Visible    //input[@name='barrier_1']    20
    Click Element    //input[@name='barrier_1']
    Clear Input Fields
    Input Text    //input[@name='barrier_1']    +0.5
    Wait Until Element Is Visible    dt_purchase_put_button    30
    Element Should Be Disabled    dt_purchase_put_button
    Wait Until Element Is Visible    //span[@data-tooltip="Contracts more than 24 hours in duration would need an absolute barrier."]    120
    Element Attribute Value Should Be    //span[@class="trade-container__tooltip dc-tooltip dc-tooltip--error"]    data-tooltip    Contracts more than 24 hours in duration would need an absolute barrier.

Close the browser
    Close Browser
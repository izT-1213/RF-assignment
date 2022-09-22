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

Change Underlying
    Wait cq-symbol
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--R_50 ']
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--R_50 ']
    Wait cq-symbol
    Element Should Contain    //div[@class='cq-symbol']   Volatility 50 Index
    Click Element    dt_contract_dropdown
    Wait Until Element Is Visible    dt_contract_multiplier_item    40
    Click Element    dt_contract_multiplier_item
    Wait Until Element Is Visible    //div[@class="purchase-container"]    120
    Element Attribute Value Should Be    //span[@name='contract_type']    value    multiplier
    Page Should Contain    Stake
    Page Should Not Contain    Payout

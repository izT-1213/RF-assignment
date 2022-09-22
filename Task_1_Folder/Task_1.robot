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

Check Real Account
    Wait Until Page Contains Element    //p[@class="acc-info__balance"]    120
    Wait Until Element Is Visible    //p[@class="acc-info__balance"]    60
    Element Should Be Visible    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--usd"]
    Click Element    dt_core_account-info_acc-info

Check can switch to Demo Account
    Wait Until Page Contains Element    dt_core_account-switcher_demo-tab    30
    Click Element    dt_core_account-switcher_demo-tab
    Wait Until Page Contains Element    dt_VRTC6751207    20
    Click Element    dt_VRTC6751207
    Wait Until Element Is Visible    dt_core_account-info_acc-info    60
    Element Should Be Visible    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--virtual"]    90
    Close Browser
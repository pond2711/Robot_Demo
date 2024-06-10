*** Settings ***
Library    SeleniumLibrary
Test Setup     Open Browser    https://demo.thingsboard.io/login    Chrome
Test Teardown  Close Browser

*** Keywords ***
Login with Email and Password
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//img[@aria-label='logo']
    Wait Until Element Is Enabled    xpath=//input[@id='username-input']
    Input Text    xpath=//input[@id='username-input']    ${USERNAME}
    Wait Until Element Is Enabled    xpath=//input[@id='password-input']
    Input Text    xpath=//input[@id='password-input']    ${PASSWORD}
    Click Element    xpath=//span[normalize-space()='Login']

*** Test Cases ***
TC001: Login with Email and Password (Correct Email, Correct Password)
    Login with Email and Password   s.paphatsirinatthi@gmail.com    adminadminadmin
    Wait Until Element Is Visible    xpath=//mat-icon[normalize-space()='account_circle']
    Element Text Should Be    xpath=//span[@class='tb-user-display-name ng-star-inserted']    Oam San1

TC002: Login with Email and Password (Correct Email, Invalid Password)
    Login with Email and Password   s.paphatsirinatthi@gmail.com    adminadmidmin
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Invalid username or password']

TC003: Login with Email and Password (Invalid Email, Correct Password)
    Login with Email and Password   s.paphatsirinthi@gmail.com    adminadminadmin]
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Invalid username or password']

TC004: Login with Email and Password (Invalid Email, Invalid Password)
    Login with Email and Password   s.paphatsiritthi@gmail.com    admadminadmin
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Invalid username or password']

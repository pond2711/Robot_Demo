*** Settings ***
Library    SeleniumLibrary
Test Template  Login with Email and Password with invalid credentials
Test Setup     Open Browser    https://demo.thingsboard.io/login    headlesschrome
Test Teardown  Close Browser

*** Keywords ***
Login with Email and Password with invalid credentials
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//img[@aria-label='logo']
    Wait Until Element Is Enabled    xpath=//input[@id='username-input']
    Input Text    xpath=//input[@id='username-input']    ${USERNAME}
    Wait Until Element Is Enabled    xpath=//input[@id='password-input']
    Input Text    xpath=//input[@id='password-input']    ${PASSWORD}
    Click Element    xpath=//span[normalize-space()='Login']
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Invalid username or password']

*** Test Cases ***                  USERNAME                        PASSWORD
Correct Email, Invalid Password     s.paphatsirinatthi@gmail.com    adminadmidmin
Invalid Email, Correct Password     s.paphatsirinthi@gmail.com      adminadminadmin
Invalid Email, Invalid Password     s.paphatsiritthi@gmail.com      admadminadmin
*** Settings ***
Library    SeleniumLibrary
Test Setup     Open Browser    https://docs.google.com/forms/d/e/1FAIpQLSfWE0BMGN9Rn-uEe8XE9WitcjPciKBQEMd35zeQkVSH0HUhqw/viewform    chrome
Suite Teardown  Close Browser

*** Keywords ***
Fill Like Course and Change Course
    [Arguments]      ${LIKE_COURSE}     ${CHANGE_COURSE}
    Wait Until Element Is Visible    xpath=//div[contains(text(),'กรุณาประเมินทักษะการสอนของผู้สอน')]
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้ชอบอะไรบ้าง')]
    Wait Until Element Is Enabled    //textarea[@aria-describedby='i2 i3']
    Input Text    xpath=//textarea[@aria-describedby='i2 i3']       ${LIKE_COURSE}
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง')]
    Wait Until Element Is Enabled    xpath=//textarea[@aria-describedby='i6 i7']
    Input Text    xpath=//textarea[@aria-describedby='i6 i7']       ${CHANGE_COURSE}
    Click element       xpath=//span[contains(text(),'ถัดไป')]

*** Test Cases ***
TC001:Field ผู้สอน: คอร์สนี้ชอบอะไรบ้าง with string, คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง with string
    Fill Like Course and Change Course      Hello       Hello
    Wait Until Element Is Visible       xpath=//span[contains(text(),'กรุณาเขียนสรุปว่าเราเรียนแล้วได้อะไรบ้าง และ คาดหวังอะไรในครั้งถัดๆไป')]
    #sleep   5s
TC002:Field ผู้สอน: คอร์สนี้ชอบอะไรบ้าง with string, คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง with empty
    Wait Until Element Is Visible    xpath=//div[contains(text(),'กรุณาประเมินทักษะการสอนของผู้สอน')]
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้ชอบอะไรบ้าง')]
    Wait Until Element Is Enabled    //textarea[@aria-describedby='i2 i3']
    Input Text    xpath=//textarea[@aria-describedby='i2 i3']   Hello
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง')]
    Wait Until Element Is Enabled    xpath=//textarea[@aria-describedby='i6 i7']
    input text      xpath=//textarea[@aria-describedby='i6 i7']     ${EMPTY}
    Click element       xpath=//span[contains(text(),'ถัดไป')]
    page should contain element     xpath=//span[@class='RHiWt']
    #sleep   5s
TC003:Field ผู้สอน: คอร์สนี้ชอบอะไรบ้าง with empyt, คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง with empty
    Wait Until Element Is Visible    xpath=//div[contains(text(),'กรุณาประเมินทักษะการสอนของผู้สอน')]
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้ชอบอะไรบ้าง')]
    Wait Until Element Is Enabled    //textarea[@aria-describedby='i2 i3']
    Input Text    xpath=//textarea[@aria-describedby='i2 i3']   ${EMPTY}
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง')]
    Wait Until Element Is Enabled    xpath=//textarea[@aria-describedby='i6 i7']
    Input Text    xpath=//textarea[@aria-describedby='i6 i7']   ${EMPTY}
    Click Element       xpath=//span[contains(text(),'ถัดไป')]
    Wait Until Element Is Visible       xpath=//span[@class='RHiWt']
    #page should contain element    xpath=//span[@class='RHiWt']
TC004:Field ผู้สอน: คอร์สนี้ชอบอะไรบ้าง with empty, คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง with string
    Fill Like Course and Change Course      ${EMPTY}       Hello
    Wait Until Element Is Visible       xpath=//span[@class='RHiWt']

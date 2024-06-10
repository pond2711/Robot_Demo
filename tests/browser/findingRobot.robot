*** Settings ***
Library    SeleniumL testsibrary
Suite Setup     Open Browser    http://www.google.com    Chrome
Test Setup      Input Text    id=APjFqb    robot
Test Teardown   Go To  http://www.google.com
Suite Teardown  Close Browser
***comment***
Library    SeleniumL testsibrary --import to run browser test
Suite Setup     Open Browser    http://www.google.com    Chrome  --before run
Test Setup      Input Text    id=APjFqb    robot --before each
Test Teardown   Go To  http://www.google.com  --after each
Suite Teardown  Close Browser  --after run

*** Test Cases ***
Searching "robot" on Google, the search result should contain Wikipedia
    Press Keys    id=APjFqb    ENTER
    Page Should Contain Link    https://th.wikipedia.org/wiki/%E0%B8%AB%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A2%E0%B8%99%E0%B8%95%E0%B9%8C

Searching "robot" on Google, the search result should contain Longdo Directory
    Press Keys    id=APjFqb    ENTER
    sleep 3s
    Page Should Contain Link    https://dict.longdo.com/search/ROBOT
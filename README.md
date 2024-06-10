Robot Framework Selenium (for Windows)
run test
-python3 -m robot ./tests/browser/openGoogle.robot
-python3 -m robot --variable WIKIPEDIA:https://th.wikipedia.com ./test/browser/findingRobotVariables.robot

xpath=//span[contains(text(),'ผู้สอน: คอร์สนี้อยากให้เปลี่ยนอะไรบ้าง')]
xpath=//textarea[@aria-describedby='i6 i7']


python3 -m robot ./tests/servey/robotSurvey.robot 
python3 -m robot ./tests/servey/TBLogin.robot 
python3 -m robot ./tests/servey/datadriven.robot 

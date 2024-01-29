*** Settings ***
Documentation    automationexercise testcase03, 04 
Library          SeleniumLibrary
Suite Setup      Open Browser   https://automationexercise.com/  chrome
Suite Teardown   Close Browser


*** Variables ***
${EMAIL}           thanet555@gmail.com
${PASSWORD}        123456789
${WRONGPASSWORD}   1234


*** Keywords ***
Click TO LOGIN PAGE
  Click Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input EMAIL
  [Arguments]   ${EMAIL}
  Input Text    //*[@id="form"]/div/div/div[1]/div/form/input[2]    ${EMAIL}

Input PASSWORD
  [Arguments]   ${PASSWORD}
  Input Text    //*[@id="form"]/div/div/div[1]/div/form/input[3]    ${PASSWORD}

Input WRONG PASSWORD
  [Arguments]   ${WRONGPASSWORD}
  Input Text    //*[@id="form"]/div/div/div[1]/div/form/input[3]    ${WRONGPASSWORD}

Click LOGIN button
  Click Element    //*[@id="form"]/div/div/div[1]/div/form/button

Click LOGOUT 
  Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a


*** Test Cases ***
TESTCASE04 Login user with incorrect email and password
  Location Should Be     https://automationexercise.com/
  Click TO LOGIN PAGE
  Input EMAIL            ${EMAIL}
  Input PASSWORD         ${WRONGPASSWORD}
  Click LOGIN button
  Page Should Contain    Your email or password is incorrect!


TESTCASE04 Logout 
  Location Should Be     https://automationexercise.com/
  Click TO LOGIN PAGE   
  Input EMAIL            ${EMAIL}
  Input PASSWORD         ${PASSWORD}
  Click LOGIN button     
  Page Should Contain    thanet
  Click LOGOUT
  Location Should Be     https://automationexercise.com/login
  
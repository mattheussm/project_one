*** Settings ***
Library   SeleniumLibrary

*** Variable ***
${url}    https://www.saucedemo.com
#${Standard_user}    standard_user
#${Locked_out_user}    locked_out_user
#${Problem_user}   problem_user
#${Performance_glitch_user}    performance_glitch_user
#${Error_user}   error_user
#${Visual_user}    visual_user
${General_Password}   secret_sauce
${Username_fd}   xpath=//input[@id="user-name"]   
${User_Password}    xpath=//input[@id="password"]

*** Keywords ***
New Session
  Open Browser    ${url}    chrome

Login Container
  [Arguments]   ${User}    
  Wait Until Element Is Visible   ${Username_fd}   10
  Input Text    ${Username_fd}   ${User}      
  Input Text    ${User_Password}    ${General_Password}   

Click on Login Button
  Click Element   xpath=//input[@id="login-button"]

Error Locked Out User
  Wait Until Element Is Visible   xpath=//div[@class="error-message-container error"]   10
  Page Should Contain   Epic sadface: Sorry, this user has been locked out.

Home Page Succesful Login
  Wait Until Element Is Visible   xpath=//img[@alt="Sauce Labs Backpack"]   10
  Capture Page Screenshot
*** Settings ***
Library   SeleniumLibrary
Library   FakerLibrary

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
${First_Name}   xpath=//input[@id="first-name"]
${Last_Name}    xpath=//input[@id="last-name"]
${Postal_Code}    xpath=//input[@id="postal-code"]
#${CODIGOPOSTALFAKE}   FakerLIbrary.Postalcode

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

Error Locked Out User   # When using this credentials, the robot will validate the error message
  Wait Until Element Is Visible   xpath=//div[@class="error-message-container error"]   10
  Page Should Contain   Epic sadface: Sorry, this user has been locked out.
  Sleep   4

Home Page Succesful Login
  Wait Until Element Is Visible   xpath=//img[@src="/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg"]   10
  Sleep   4   # remove after evidence

Logout
  Click Element   xpath=//button[@id="react-burger-menu-btn"]
  Wait Until Element Is Visible   xpath=//a[@id="logout_sidebar_link"]    10
  Click Element   xpath=//a[@id="logout_sidebar_link"]

Confirming Logout
  Wait Until Element Is Visible   ${Username_fd}   10
  Capture Page Screenshot
  Sleep   4   # remove after evidence

Validating Wrong Home Page    # This keyword is just to confirm that the home page is loading with wrong images
  Wait Until Element is Visible   xpath=//img[@src="/static/media/sl-404.168b1cce.jpg"]   10
  Capture Page Screenshot

Choosing an Item
  Click Element   xpath=//a[@id="item_4_title_link"]

Add Item To Cart
  Click Element   xpath=//button[@class="btn btn_primary btn_small btn_inventory"]

Clicking on Shopping Cart
  Click Element   xpath=//a[@class="shopping_cart_link"]
  Click Element   xpath=//button[@id="checkout"]

Fill Checkout Info Form    
  Wait Until Element Is Visible   xpath=//div[@class="checkout_info"]   10
  
  ${FIRSTNAMEFAKE}     FakerLibrary.FirstName
  Input Text    ${First_Name}   ${FIRSTNAMEFAKE}

  ${LASTNAMEFAKE}   FakerLibrary.LastName
  Input Text    ${Last_Name}    ${LASTNAMEFAKE}

  ${CODIGOPOSTALFAKE}   FakerLibrary.Postalcode
  Input Text    ${Postal_Code}    ${CODIGOPOSTALFAKE}

Button Continue
  Click Element   xpath=//input[@id="continue"]

Checkout Overview Confirmation
  Wait Until Element Is Visible   xpath=//div[@id="checkout_summary_container"]   10

Finish Purchase
  Click Element   xpath=//button[@id="finish"]
  Page Should Contain   Thank you for your order!
  Capture Page Screenshot

Back Home
  Click Element   xpath=//button[@name="back-to-products"]

Add to Cart from Home Page
  Click Element   xpath=//button[@id="add-to-cart-sauce-labs-backpack"]
*** Settings ***
Library   SeleniumLibrary
Resource    ../resources/base_saucedemo.robot

*** Test Cases ***

Login Standard User
# robot -i standard_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    standard_user   regression   
  New Session

  Login Container   standard_user
  Click on Login Button
  Home Page Succesful Login

Login Locked Out User
# robot -i locked_out_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    locked_out_user   regression
  New Session

  Login Container   locked_out_user
  Click on Login Button

Login With Problem User
# robot -i problem_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    problem_user    regression
  New Session

  Login Container  problem_user
  Click on Login Button

Login With Performance Glitch User
# robot -i performance_glitch_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    performance_glitch_user   regression
  New Session

  Login Container   perfomance_glitch_user
  Click on Login Button

Login Error User
# robot -i error_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    error_user    regression
  New Session

  Login Container   error_user
  Click on Login Button

Login With Visual User
# robot -i visual_user -d ./logs/ tests/cases_saucedemo.robot
  [TAGS]    visual_user   regression
  New Session

  Login Container   visual_error
  Click on Login Button
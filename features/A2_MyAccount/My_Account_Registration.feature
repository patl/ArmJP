Feature: Check the log in functionality
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up


  Scenario Outline: Check register functionality from pop-up
    When user do mouseover on the My account link from header
    Then user should see the Log In pop-up
    When user press on Registration button
    Then user redirects to Create account page
    Then user verify that social icons are present
    Then user fills greeting by <greeting>
    And fills first name field
    And fills last name field
    And fills email field
    And fills confirmation email field
    And fills password field
    And fills confirmation password field
    And fills  Mobile number
    And fills Phone number
    And fills DoB by <dob>
    Then user subscribe to the emails
    When user presses on Create account button
    Then user redirects to my account page <welcome>
    When user do mouseover on the My account link from header
    When user click on  log out from account
    When user do mouseover on the My account link from header
    Then user fills email
    And user fills password
    When user press on Sign in button
    Then user redirects to my account page <welcome>


    Examples:
      |greeting|dob       |welcome|
      |Mr      |01/02/1991|ようこそ|
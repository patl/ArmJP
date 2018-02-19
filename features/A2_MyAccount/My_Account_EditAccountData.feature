Feature: edit account information
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up

  Scenario Outline: Edit personal data
    When user do mouseover on the My account link from header
    Then user should see the Log In pop-up
    Then user verify that Social Log in section is present
    Then user fills the email filed with <email>
    Then user fills the password field with <password>
    When user press on Sign in button
    Then user redirects to my account page <welcome>
    When user do mouseover on the My account link from header
    Then user presses on account settings link
    Then user presses on edit account button
    Then fills first name field
    Then fills last name field
    Then fills email field
    When user press on save button
    Then user should see pop-up
    When user press on OK button
    When user do mouseover on the My account link from header
    Then user presses on account settings link
    Then user verifies that data are changed
    Then user presses on edit account button
    Then user fills the old email filed with <email>
    When user press on save button
    Then user should see pop-up
    When user press on OK button


    Examples:
      |email                         |password   |welcome|
      |oleksiy.boyko@osf-commerce.com|Ogboiko!123|ようこそ|


  Scenario Outline: Change password
    When user do mouseover on the My account link from header
    Then user should see the Log In pop-up
    Then user verify that Social Log in section is present
    Then user fills the email filed with <email>
    Then user fills the password field with <password>
    When user press on Sign in button
    Then user redirects to my account page <welcome>
    When user do mouseover on the My account link from header
    Then user presses on account settings link
    When user press on change password button
    Then user fills old password field with <password>
    Then user fills new password field with <newpass>
    Then user fills confirmation password field with <newpass>
    When user press on confirmation button for reset password
    Then user should see confirmation page for reset password
    When user do mouseover on the My account link from header
    When user click on  log out from account
    When user do mouseover on the My account link from header
    Then user should see the Log In pop-up
    Then user verify that Social Log in section is present
    Then user fills the email filed with <email>
    Then user fills the password field with <newpass>
    When user press on Sign in button
    Then user redirects to my account page <welcome>
    When user do mouseover on the My account link from header
    Then user presses on account settings link
    When user press on change password button
    Then user fills old password field with <newpass>
    Then user fills new password field with <password>
    Then user fills confirmation password field with <password>
    When user press on confirmation button for reset password
    Then user should see confirmation page for reset password


    Examples:
      |email                         |password   |newpass    |welcome|
      |oleksiy.boyko@osf-commerce.com|Ogboiko!123|NewPass!123|ようこそ|

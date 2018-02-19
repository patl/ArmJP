Feature: Check subscription functionality from pop-up, header and footer
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present


  Scenario Outline: subscription functionality from pop-up
    When user pres on sign up button
    Then user should see validation error for email <emailerror>
    And user should ses validation error for privacy-policy <pperror>
    Then user fills email field for email subscription pop-up with <wrongemail>
    Then user should see validation error for email <emailerror2>
    When user fills email field with email
    Then user checks the privacy policy
    When user pres on sign up button
    Then user should see thank you pop-up
    And close the newsletter pop-up


    Examples:
    |emailerror                     |emailerror2                         |pperror                           |wrongemail|
    |Eメールアドレスを入力してください|有効なEメールアドレスを入力してください|You must accept the Privacy Policy|asd@      |


    Scenario Outline: subscription functionality from footer
      Then close the newsletter pop-up
      When user press on subscribe button form footer
      And user should see validation message for privacy and policy <pperror>
      And user should see validation message for email_footer <emailerror>
      Then user press on privacy and policy checkbox
      And user fills email field from footer with incorrect email <wrongemail>
      When user press on subscribe button form footer
      And user should see validation message for email_footer <emailerror2>
      When user fills email field from footer with incorrect email
      When user press on subscribe button form footer
      Then user should see thank you pop-up
      And close the newsletter pop-up

      Examples:
      |pperror                                           |emailerror                     |wrongemail|emailerror2                          |
      |プライバシーポリシーをご承諾していただく必要があります|Eメールアドレスを入力してください|blabla@sd |有効なEメールアドレスを入力してください|

  Scenario Outline: subscription functionality from header
    Then close the newsletter pop-up
    When user do mousover on newsletter link from header
    Then user should see newsletter pop-up
    When user press on subscribe button form pop-up
    Then user should see error message for email from pop-up <erroremail>
    Then user should see error message for p&p <errorp&p>
    Then user press on privacy and policy checkbox from newsletter pop-up header
    And user fills email field from email pop-up with incorrect email <wrongemail>
    When user press on subscribe button form pop-up
    Then user should see error message for email from pop-up <erroremail2>
    When user fills email field from footer with correct email from newsletter pop-up header
    When user press on subscribe button form pop-up
    Then user should see thank you pop-up
    And close the newsletter pop-up

  Examples: :
    |erroremail                     |errorpp                                            |wrongemail|erroremail2                         |
    |Eメールアドレスを入力してください|プライバシーポリシーをご承諾していただく必要があります|blabla@asd |有効なEメールアドレスを入力してください|

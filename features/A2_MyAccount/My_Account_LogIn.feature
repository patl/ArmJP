Feature: Check the log in functionality
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up

    Scenario Outline: Check log in functionality from pop-up
      When user do mouseover on the My account link from header
      Then user should see the Log In pop-up
      Then user verify that Social Log in section is present
      When user press on Sign in button
      Then user should see validation message for email <messageemail>
      And user should see validation message for password <messagepassword>
      Then user fills the email filed  <wrongemail>
      When user press on Sign in button
      And user should see validation message for wrong email <wrongemailmessage>
      Then user fills the email filed with <email>
      Then user fills the password with <wrongpass> =! email
      When user press on Sign in button
      And user should see validation message for wrong password <wrongpasswordmessge>
      Then user fills the password field with <password>
      When user press on Sign in button
      Then user redirects to my account page <welcome>
      Then Verify that user can see <welcome> + last name + first name + 様

      Examples:
      |email            |password   |username|messageemail                   |messagepassword           |wrongemailmessage                   |wrongemail       |wrongpass|wrongpasswordmessge                                                                        |welcome|
      |ogboiko@gmail.com|Ogboiko!123|o. boyko|Eメールアドレスを入力してください|パスワードを入力してください|有効なEメールアドレスを入力してください| ogboikogmail.com|blablabla|申し訳ございませんが、登録されている情報と一致しません。入力内容を確認し、もう一度お試しください。|ようこそ|


        Scenario Outline: Check the reset password functionality from pop-up
          When user do mouseover on the My account link from header
          Then user should see the Log In pop-up
          When user press on Forgot password link
          Then user should see reset password pop-up
          When user fills email field for reset password with <email>
          And press on Send button for reset password
          Then user should see the Confirmation pop-up for reset password
          When user presses on Close button for confirmation button
          And Confirmation password pop-up is close

          Examples:
          |email            |
          |ogboiko@gmail.com|

          Scenario Outline: Check log in functionality via social FB
            When user do mouseover on the My account link from header
            Then user should see the Log In pop-up
            #When user press on FB icon
            #Then user fills email/phone to FB account with <email/phone>
            #And user fills password to FB account with <password>
            #When user presses on "log in" button
            #Then user should be logged in
            #ToDo the same for othe Cosial

  Examples:
            |email/phone      |
            |ogboiko@gmail.com|




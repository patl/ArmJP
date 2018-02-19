Feature: Check the HP elements
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up

    Scenario Outline: Check the elements on the HP
      And verify that Country selector isn't visible in header


      And verify that user can see header
      And verify that user can't see country sector
      And user can see stores
      And user can see logo
      And user can see 'Email sign up'
      And user can see 'My account'
      And user can see 'Minicart'
      When user presses on Guaranteed Logo
      Then close the Guaranteed pop-up
      Then user verifies that  Guaranteed pop-up is closed

      Then user can see navigation menu
      When user do mousover on the L1 <l1>
      Then user should see L2
      And user should see L3
      When user press on search field
      Then user should see search field
      When user press on search field
      Then should field should be closed
      Then verify that 'olapic' section is not displayed
              #add other section

      Then verify that user can see Email field in the footer
      And verify that find a store field is present in the footer
      And verify that social links are present in the footer
      Then verify that footer navigation links are present
      #And verify that payment icons are not present
Examples:
      |l1|
      | 1|
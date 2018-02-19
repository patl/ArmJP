Feature: Check the QV functionality
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up


  Scenario Outline: Verify the QV pop-up elements and add product to wish list as guest
    When user do mousover on the L1 <l1>
    Then press on l2
    When user click on QV button
    Then user should see the QV pop-up
    Then verify that product image is present
    And verify that Product name is present
    And verify that Product description is present
    #And verify that Quantity is displayed
    And verify that product price is displayed
    And Verify that add to bag button is displayed
    And Verify that Wish List icon is present
    When register pop-up is displayed
    Then user fills email with <email> from add to wish pop-up
    Then user fills password with <password> from add to wish pop-up
    When user press on log in button from with pop-up
    Then user should see save result pop-up
    When user click on go to wish list button from save result pop-up
    Then user should be redirected to my account -> wish list page
    And verify that added product is displayed in the list
    Then user press on delete link
    And user shouldn't see added product in wish list


    Examples:
      |l1|email            |password   |
      | 1|ogboiko@gmail.com|Ogboiko!123|

  Scenario Outline: Verify the PDP elements and add product to wish list as guest
    When user do mousover on the L1 <l1>
    Then press on l2
    When user click on PDP button
    Then verify that product image is present on PDP
    And verify that Product name is present on PDP
    And verify that Product description is present on PDP
 #And verify that Quantity is displayed
    And verify that product price is displayed on PDP
    And Verify that add to bag button is displayed on PDP
    And Verify that Wish List icon is present
    When register pop-up is displayed
    Then user fills email with <email> from add to wish pop-up
    Then user fills password with <password> from add to wish pop-up
    When user press on log in button from with pop-up
    Then user should see save result pop-up
    When user click on go to wish list button from save result pop-up
    Then user should be redirected to my account -> wish list page
    And verify that added product is displayed in the list
    Then user press on delete link
    And user shouldn't see added product in wish list

    Examples:
      |l1|email            |password   |
      | 1|ogboiko@gmail.com|Ogboiko!123|


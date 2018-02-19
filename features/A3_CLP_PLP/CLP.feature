Feature: Check the CLP and PLP functionality
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up

    Scenario Outline: Verify clp\plp
      When user do mousover on the L1 <l1>
      Then user should see L2
      And user should see L3
      When user press on the l1
      #Then user verify that l1 page included l1 title
      When user do mousover on the L1 <l1>
      When press on l2
      #Then user verify that l2 page is included l2 title
      When user click on sort by and selects price low to height
      Then user verify that products on the page are sorted correctly
      Examples:
      |l1|
      | 1|

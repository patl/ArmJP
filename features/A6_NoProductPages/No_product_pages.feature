Feature: Check No Product pages
  Background:
    Given open the site
    Then user verify that newsletter pop-up is present
    And close the newsletter pop-up

  Scenario Outline: Check the Store locator page
    Then user press on store locator icon from header
    When user checked the search filed <county>
    Then user checked the stores list
    And user checked the map

    Examples:
    |county|
    |Japan |

  Scenario Outline: check the search functionality
    When user press on search icon from heder
    Then user entered searchable word <serchword>
    When user see search  suggestion list
    And press on search button for search
    When user see the search result page
    When user click on sort by and selects price low to height
    Then user verify that products on the page are sorted correctly
    Examples:
      |serchword|
      |face     |





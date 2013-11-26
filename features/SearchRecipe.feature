Feature: Displays specific recipe by search

Background: recipe has been added to the database

  Given the following recipes exist:
  | name | picture  | description      | overall rating | ingredients | instruction | posted date |
  | test | test.jpg | a summer dessert | 5              | sugar       | 1.          | 2013-11-23  |

  And I am on the ABD home page

Scenario: Search recipe by title
  Given I am logged in as "test"
  Then I should see "Search"
  When I fill in "Name" with "Chocolate Mousse"
  And I follow "Search"
  Then I should be on the Recipe page
  And I should see "Chocolate Mousse"
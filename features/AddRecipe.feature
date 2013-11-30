#http://pastebin.com/CSCVp9M3
Feature: User adds a recipe

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | picture  | interests |
  | test     | Test | test123  | test.jpg | FOOD      |

  And I am on the recipes page

Scenario: User adds a recipe
  #Given I am logged in as "test"
  Then I should see "New Recipe"
  When I follow "New Recipe"
  Then I should be on the Create New Recipe page
  When I fill in "Name" with "Chocolate Mousse"
  And I fill in "Picture" with "http://i.stack.imgur.com/hxgzB.jpg"
  And I fill in "Description" with "DELICIOUS"
  And I fill in "Ingredients" with "DELICIOUS"
  And I fill in "Instructions" with "EAT"
  And I press "Create Recipe"
  Then I should be on the recipes page
  And I should see "Chocolate Mousse"

#Scenario: Viewer can't see "Add new recipe"
#  Then I should not see "Add new recipe"

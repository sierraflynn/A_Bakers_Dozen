#http://pastebin.com/CSCVp9M3
Feature: User adds a recipe

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation | picture  | interests |
  | test     | Test | test123  | test123	       | test.jpg | FOOD      |

  Given I am on the ABD home page
  Given I am logged in as "test" with password "test123"
  And I am on the recipes page

Scenario: User adds a recipe
  Then I should see "Post New Recipe"
  When I follow "Post New Recipe"
  Then I should be on the Create New Recipe page
  When I fill in "Name" with "Chocolate Mousse"
  And I fill in "Picture" with "http://i.stack.imgur.com/hxgzB.jpg"
  And I fill in "Description" with "DELICIOUS"
  And I fill in "Ingredients" with "DELICIOUS"
  And I fill in "Instructions" with "EAT"
  And I press "Create Recipe"
  Then I should be on the "Chocolate Mousse" recipe page
  And I should see "Chocolate Mousse"

Scenario: Viewer can't see "Add new recipe"
  When I follow "Log-out"
  Then I should be on the recipes page
  And I should see "Please sign-in to post a recipe."
  And I should not see "Add new recipe"

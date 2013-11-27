Feature: User click on a particular recipe link

Background: recipe has been added to the database

  Given the following recipes exist:
  | name    | description | user_id |
  | cookies | yummy       | 1       |

  And I am on the ABD home page

Scenario: User clicks on a recipe link
  Given I am logged in as "test"
  Then I should see "Recipe Lists"
  When I follow "Recipe Link"
  Then I should be on the specific Recipe page

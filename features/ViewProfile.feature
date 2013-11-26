Feature: User views their profile and their recipes

Background: user has been added to the database

  Given the following users exist:
  | username | name | picture  | interests |
  | test     | Test | test.jpg | FOOD      |

  And I am on the ABD home page

Scenario: User sees their profile page
  Given I am logged in as "test"
  Then I should see "Profile"
  When I follow "Profile"
  Then I should be on the profile page

Scenario: User sees their recipe page
  Given I am logged in as "test"
  When I follow "Profile"
  Then I should see "My recipe lists"
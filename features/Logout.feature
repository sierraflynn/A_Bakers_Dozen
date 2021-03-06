Feature: User can log-out

Background: user has been added to the database

  Given the following users exist:
  | username  | name        | password | password_confirmation |
  | test      | Bob         | test123  | test123               |

  And I am on the ABD home page
  And I am logged in as "test" with the password "test123"

Scenario: Log-out
  Then I should see "Log-out"
  And I should not see "Log-in"
  When I follow "Log-out"
  Then I should be on the home page
  And I should see "You have been logged out."
  And I should see "Log-in"

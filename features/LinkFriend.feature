Feature: User click on a friend link

Background: user has been added to the database

  Given the following users exist:
   | username | name | password | password_confirmation | 
   | TIM C    | Test | test123  | test123	        |
   | test     | Test | test123  | test123	        |

  And I am on the ABD home page

Scenario: User clicks on a friend's link
  Given I am logged in as "TIM C" with password "test123"
  And I am on the "TIM C" profile page
  Then I should see "TIM C's Friends"
  When I follow "test"
  Then I should be on the "test" profile page

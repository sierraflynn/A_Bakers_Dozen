#http://pastebin.com/CSCVp9M3
Feature: Viewer views a recipe
  #I left out a bunch of the variables since they're not important to test
Background: recipe has been added to the database
  Given the following users exist:
  | username | name | password | password_confirmation |
  | Bob      | test | test123  | test123               |

  Given the following recipes exist:
  | name    | description | user_id | ingredients     | instructions | 
  | cookies | yummy       | 1       | 1 cup of sugars | 1. pouring   |

  Given the following comments exist:
  | content     | recipe_id | user_id | rating |
  | "delicious" | 1         | 1       | 4      |

  And I am on the recipes page

Scenario: Viwer views a recipe and its details
  Then I should see "cookies"
  When I follow "cookies"
  Then I should see "cookies"
  And I should see "yummy"
  #And I should see "Bob"
  #And I should see "delicious"

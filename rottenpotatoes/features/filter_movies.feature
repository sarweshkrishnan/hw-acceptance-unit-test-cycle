Feature: display list of movies filtered movies
 
  As a user
  I want to see movies matching only certain ratings

Background: movies have been added to database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

  And  I am on the home page

Scenario: restrict to movies with 'PG' ratings
  When I check the following ratings: PG
  And I uncheck the following ratings: R, G, PG-13
  And I press "ratings_submit"
  Then I should see "Star Wars"
  And I should see "Blade Runner"

Scenario: all ratings selected
  When I check the following ratings: PG, R, G, PG-13
  And I press "ratings_submit"
Then I should see all the movies
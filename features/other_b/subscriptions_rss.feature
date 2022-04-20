  Feature: Subscriptions
  In order to follow an author I like
  As a reader
  I want to subscribe to them
  With RSS

  Scenario: Subscribe to a user when there are no works by them

  When I am logged in as "interesting_author"
  When I am logged in as "uninteresting_author"
    And I post the work "My Work Title"
  When I am logged in as "reader"
    And I go to interesting_author's user page
  Then I should see "RSS Feed"
  When I follow "RSS Feed"
  Then I should not see "My Work Title"

  Scenario: Subscribe to a user when there are works by them

  When I am logged in as "interesting_author"
    And I post the work "My Work Title"
  When I am logged in as "reader"
    And I go to interesting_author's user page
  Then I should see "RSS Feed"
  When I follow "RSS Feed"
  Then I should see "My Work Title"

  Scenario: Subscribe to a user but user does not exist

  When I view the RSS feed of user "999999" 
  Then I should see "Error 404"
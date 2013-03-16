Feature: Merge Articles
  As a blog administrator
  In order to clean up related blogs
  I want to be able to merge two articles into one article in my blog

  Background:
    Given the blog is set up
    And two articles exist
    And two comments exist

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I follow "All Articles"
    And I am editing the page for article "1"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the show article page
    And the article title should be one or the other
    And the article content should be merged
    And I should see all merged article comments

  Scenario: Cannot merge articles if not admin
    Given I am logged in not as admin
    And I am editing the page for article "1"
    Then I should not see "Merge"
    
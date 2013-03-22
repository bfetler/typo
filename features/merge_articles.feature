Feature: Merge Articles
  As a blog administrator
  In order to clean up related blogs
  I want to be able to merge two articles into one article in my blog

  Background:
    Given the blog is set up
    And article with user "admin", author "fred", title "hey", and body "yabba dabba doo!" exists
    And article with user "wilma", author "wilma", title "oh", and body "oh dear." exists
    And comment with author "barney" and body "huh" for article with title "hey" exists
    And comment with author "betty" and body "you said it" for article with title "oh" exists
    And comment with author "betty" and body "jeepers" for article with title "oh" exists

  Scenario: Cannot merge articles if not admin
    Given I am logged in as wilma
    And I am editing the page for article with title "oh"
    Then I should not see "Merge"
    And the article with title "oh" should have "2" comments

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I follow "All Articles"
    And I am editing the page for article with title "hey"
    When I fill in "merge_with" with "oh"
    And I press "Merge"
    Then the article title should be "hey"
    And the article with title "hey" should have body "yabba dabba doo! oh dear."
    And the article with title "hey" should have "3" comments

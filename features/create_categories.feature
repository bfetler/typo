Feature: Create and Edit Categories
  As a blog administrator
  In order to categorize blogs
  I want to be able to create and edit categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Create a new category
    When I follow "Categories"
    Then I should be on the new category page
    And I should see "Categories"
    And I should see "Keywords"
    
  Scenario: Saving a new category requires a name
    When I follow "Categories"
    And I fill in "Description" with "whos on first"
    And I press "Save"
    Then there should not be a category with name "who"
    And I should see "Category could not be saved."
    
  Scenario: Save a new category
    When I follow "Categories"
    And I fill in "Name" with "who"
    And I fill in "Description" with "whos on first"
    And I press "Save"
    Then there should be a category with name "who"
    And I should see "Category was successfully saved."
    And I should see "who"
    And I should see "whos on first"

  Scenario: Edit an existing category
    Given category with name "what" exists
    And I am editing the page for category with name "what"
    And I fill in "Description" with "whats on second"
    And I press "Save"
    Then there should be a category with name "what"
    And category with name "what" should have description "whats on second"
    And I should see "Category was successfully saved."
    And I should see "what"
    And I should see "whats on second"


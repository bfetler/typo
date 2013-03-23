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
    And I fill in "Description" with "A list of Whos in Whoville"
    And I press "Save"
    Then there should not be a category with name "who"
    And I should see "Category could not be saved."
    
  Scenario: Save a new category
    When I follow "Categories"
    And I fill in "Name" with "who"
    And I fill in "Description" with "A list of Whos in Whoville"
    And I press "Save"
    Then there should be a category with name "who"
    And I should see "who"

  Scenario: Edit an existing category
    Given there is a category with name "who"
    And I follow "Categories"
    And I am editing the page for category with name "who"
    Then there should be a category with name "who"


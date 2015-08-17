Feature: The hi page
In order to show off routing
I want to implement a route called hi

Scenario: Visiting the hi route
Given I am a site visitor
When I am on the hi page
Then I should see "Hi there!"
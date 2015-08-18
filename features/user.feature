Feature: The user
As the system
In order to manage users
I want to create user objects

Scenario: A user is created
Given that I am using the system
When a user exists with the following values:
  | firstname | lastname |
  | Bob       | Foo      |
And I visit the users page
Then I should see "Bob"
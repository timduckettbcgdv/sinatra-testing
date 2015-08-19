Feature: The user
As the system
In order to manage users
I want to create user objects

Scenario: A user is created
Given that I have reset the database
When users exist with the following values:
  | firstname | lastname |
  | Alice     | ALICE    |
  | Bob       | BOB      |
  | Charlie   | CHARLIE  |
  
And I visit the users page
Then I should see "Alice"
And I should see "Bob"
And I should see "Charlie"

Scenario: An account is created
Given that I have reset the database
And there is a user with an name of "Alice"
And she has accounts with the following balances
  | balance |
  | 12.34   |
  | 56.78   |
  | 98.76   |
When I visit the accounts page for "Alice"
Then the JSON response at "firstname" should be "Alice"
And the JSON response at "accounts" should be:
"""
[
  {
    "id": 1,
    "balance": 12.34
  },
  {
    "id": 2,
    "balance": 56.78
  },
  {
    "id": 3,
    "balance": 98.76
  }    
]
"""

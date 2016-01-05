Feature: Sign up
 
  As a new user
  So that I can create a new account

Background: users have been added to database

  Given the following users exist:
  | email              | password    | 
  | 12345@gmail.com    | 987654321   |
  | sjhdkas@gmail.com  | adfgeukfhea |
  And I am on the login page

Scenario: login successfully
  Given I am on the login page
  And I fill in "email" with "12345@gmail.com"
  And I fill in "login_password" with "987654321"
  When I press "Log in"
  Then I should see "Wow, Welcome again, you logged in as 12345@gmail.com"

Scenario: login fail
  Given I am on the login page
  And I fill in "email" with "12345@gmail.com"
  And I fill in "login_password" with "xxx987654321"
  When I press "Log in"
  Then I should see "Invalid Username or Password"

Scenario: create
  Given I am on the create page
  And I fill in "email" with "1234@gmail.com"
  And I fill in "password" with "12345678"
  And I fill in "lastname" with "White"
  And I fill in "firstname" with "Sam"
  And I fill in "gender" with "male"
  And I fill in "role" with "teacher"
  And I press "Create"
  Then I should see "Sign Up Successfully!"
Feature: Signing in
  Scenario: Unsuccessful signin
    Given a seller visits the signin page
    When he submits invalid signin information
    Then he should see an error message

  Scenario: Successful signin
    Given a seller visits the signin page
    And the seller has an account
    And the seller submits valid signin information
    Then he should see his profile page
    And he should see a signout link
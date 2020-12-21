Feature: Apply for Product
  Scenario: Applying a product related to a certain conference
    Given the user is on the "ProductsPage"
    When the user taps on a product
    And the user taps the "ApplyForButton"
    And the user fills out a small "ApplianceForm" with "This is a Test Form"
    And the user presses "ContinueButton"
    Then the app adds the user to the candidates list for that specific product

  Scenario: Unapplying a product related to a certain conference
    Given the user is on the "ProductsPage"
    When the user taps on a product
    And the user taps the "ApplyForButton"
    Then the app removes the user from the candidates list for that specific product
Feature: Adding a Product
    Scenario: Promoting/recommending products on the conference
        Given the host is on the "ProductsPage"
        When the host taps the "AddProducts" button
        Then the host fills out the "ProductName" with "TestName"
        And the host fills out the "ProductDescription" with "TestDescription"
        And the host fills out the "TargetAudience" with "TestTargetAudience"
        And the host taps the "NextProductPage" button
        And the host taps the "SelectConference"
        Then the app creates a new product
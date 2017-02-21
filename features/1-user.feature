Feature: 1. Filter feature

  Scenario: Property positive filter
    Given I have opened create filter screens
    When I create property_positive filter
    Then I validate created filter

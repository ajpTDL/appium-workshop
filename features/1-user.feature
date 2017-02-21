Feature: 1. Filter feature

  Scenario: Property positive filter
    Given I have opened create filter screen
    When I create property_positive filter
    Then I validate created filter

  Scenario: Transport positive filter
    Given I have opened create filter screen
    When I create transport_positive filter
    Then I validate created filter

  Scenario: Transport negative filter
    Given I have opened create filter screen
    When I create transport_negative filter
    Then I am on parameters screen

  Scenario: Work positive filter
    Given I have opened create filter screen
    When I create work_positive filter
    Then I validate created filter

  Scenario: Work negative filter
    Given I have opened create filter screen
    When I create work_negative filter
    Then I am on parameters screen

Feature:
  If the payment is for a physical product, generate a packing slip for shipping.

  Scenario: Purchasing multiples of one product
    Given I order 2 "Widget X 2000" items
    Then I should see a packing slip with a total of $500


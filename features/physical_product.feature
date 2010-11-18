Feature: Physical Product
  If the payment is for a physical product, generate a packing slip for shipping.

  Scenario: Purchasing multiples of one product
    Given a product named "Widget X 2000" that costs $250
    When I order 2 "Widget X 2000" items
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    2       Widget X 2000   $250.00     $500.00
    Grand total: $500.00
    """
    And the sales agent should receive a commission payment


  Scenario: Purchasing multiples of two different products
    Given a product named "Widget X 2000" that costs $250
    And a product named "Widget Y 2010" that costs $500
    When I order 2 "Widget X 2000" items
    And I order 3 "Widget Y 2010" items
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    2       Widget X 2000   $250.00     $500.00
    3       Widget Y 2010   $500.00     $1500.00
    Grand total: $2000.00
    """
    And the sales agent should receive a commission payment


  Scenario: Purchasing the "Learning to Ski" video
    Given a product named "Learning to Ski" that costs $15
    And a product named "First Aid" that is free
    When I order 1 "Learning to Ski" video
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    1       Learning to Ski $15.00      $15.00
    1       First Aid       $0.00       $0.00
    Grand total: $15.00
    """


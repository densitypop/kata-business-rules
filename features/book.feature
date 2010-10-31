Feature:
  If the payment is for a book, create a duplicate packing slip for the royalty department.

  Scenario: Purchase a book
    Given I order a copy of "Blink"
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    1       Blink           $3.00       $3.00
    Grand total: $3.00
    """
    And the packing slip should be sent to the royalty department
    And the sales agent should receive a commission payment


Feature:
  If the payment is for a membership, activate that membership.

  Scenario: Purchase membership
    Given I purchase a membership
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    1       Membership      $250.00     $250.00
    Grand total: $250.00
    """
    And my membership should be activated

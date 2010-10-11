Feature:
  If the payment is for a membership, activate that membership.
  If the payment is an upgrade to a membership, apply the upgrade.

  Scenario: Purchase membership
    Given I purchase a membership
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    1       Membership      $250.00     $250.00
    Grand total: $250.00
    """
    And my membership should be activated

  Scenario: Upgrade membership
    Given I upgrade my membership
    Then I should see a packing slip:
    """
    Qty     Item            Price Each  Total
    1       Upgrade Member  $100.00     $100.00
    Grand total: $100.00
    """
    And my membership should be upgraded

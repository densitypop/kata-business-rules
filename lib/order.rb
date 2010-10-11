class Order


  def initialize(*line_items)
    @line_items = line_items || []
  end


  def dispatch
    line_items.map(&:item_indication).map do |indication|
      lookup_indication(indication)
    end
  end

  def grand_total
    line_items.inject(0) do |sum, line_item|
      sum += line_item.total
    end
  end


  def add_line_item(line_item)
    line_items << line_item
  end


  def lookup_indication(indication)
    indications[indication]
  end


  def indications
    {
      send_copy_to_royalty_dept: "A copy of the packing slip was sent to the royalty department",
      activate_membership: "Your membership has been activated. We have sent you an email confirming your request.",
      upgrade_member: "Your membership has been upgraded. We have sent you an email confirming your upgrade."
    }
  end

  private

  def line_items; @line_items end


end

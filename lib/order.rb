class Order


  def initialize(*line_items)
    @line_items = line_items || []
  end


  def grand_total
    line_items.inject(0) do |sum, line_item|
      sum += line_item.total
    end
  end


  def add_line_item(line_item)
    line_items << line_item
  end


  private

  def line_items; @line_items end


end

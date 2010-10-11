class LineItemParser


  def self.parse(raw_line_item)
    quantity, name = raw_line_item.split(";")
    LineItem.new(quantity.to_i, Item.new(name))
  end


end

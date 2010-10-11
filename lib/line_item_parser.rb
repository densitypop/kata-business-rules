class LineItemParser


  def self.parse(raw_line_item)
    quantity, name = raw_line_item.split(";")
    LineItem.new(quantity.to_i, build_item(name))
  end

  def self.build_item(name)
    Item.new(name)
  end


end

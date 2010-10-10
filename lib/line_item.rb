class LineItem
  attr_reader :quantity

  def initialize(quantity, item)
    @quantity = quantity
    @item = item
  end


  def item_name; item.name end
  def item_price; item.price end

  def total
    quantity * item_price
  end

  private

  def item; @item end


end

module IndicationDispatchers
  class FreeFirstAidVideo

    def initialize(order)
      @order = order
    end


    def run
      @order.add_line_item(LineItem.new(1, Item.new("First Aid")))
    end


  end
end



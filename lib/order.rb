require File.expand_path(File.dirname(__FILE__) + '/indication_dispatcher')

class Order
  attr_accessor :indications
  attr_accessor :line_items


  def initialize(*line_items)
    @indications = []
    @line_items = []
    line_items.each do |line_item|
      add_line_item(line_item)
    end
  end


  def grand_total
    line_items.inject(0) do |sum, line_item|
      sum += line_item.total
    end
  end


  def add_line_item(line_item)
    line_items << line_item
    dispatch_indication(line_item.item_indication) if line_item.item_indication
  end


  def dispatch_indication(indication)
    IndicationDispatcher.new(indication, self).dispatch
  end



end

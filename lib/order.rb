require File.expand_path(File.dirname(__FILE__) + '/indication_dispatcher')

class Order
  attr_accessor :indications


  def initialize(*line_items)
    @line_items = line_items || []
    @indications = []
  end


  def dispatch
    line_items.map(&:item_indication).compact.map do |indication|
      dispatch_indication(indication)
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


  def dispatch_indication(indication)
    IndicationDispatcher.new(indication, self).dispatch
  end


  private

  def line_items; @line_items end


end

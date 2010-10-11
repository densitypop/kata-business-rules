require File.expand_path(File.dirname(__FILE__) + '/lib/item')
require File.expand_path(File.dirname(__FILE__) + '/lib/order')
require File.expand_path(File.dirname(__FILE__) + '/lib/line_item')
require File.expand_path(File.dirname(__FILE__) + '/lib/line_item_parser')

class Runner


  def initialize(*args)
    @items = File.read("input.txt")
    @line_items = @items.split("\n")
  end


  def print_packing_slip
    slip = ["%-8s%-16s%-12s%s" % ["Qty", "Item", "Price Each", "Total"]]
    order = Order.new
    @line_items.each do |raw_line_item|
      line_item = LineItemParser.parse(raw_line_item)
      order.add_line_item(line_item)
      slip << "%-8d%-16s$%-11.2f$%.2f" % [line_item.quantity, line_item.item_name, line_item.item_price, line_item.total]
    end
    slip << "Grand total: $%.2f" % [order.grand_total]
    slip += order.dispatch

    puts slip.join("\n").chomp
  end


  def self.run
    self.new(*ARGV).print_packing_slip
  end

end

Runner.run

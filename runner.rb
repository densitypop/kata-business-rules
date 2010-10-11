require File.expand_path(File.dirname(__FILE__) + '/lib/item')
require File.expand_path(File.dirname(__FILE__) + '/lib/order')
require File.expand_path(File.dirname(__FILE__) + '/lib/line_item')

class Runner


  def initialize(*args)
    @items = File.read("input.txt")
    @line_items = @items.split("\n")
  end


  def print_packing_slip
    slip = ["Qty             Item            Price Each        Total"]
    order = Order.new
    @line_items.each do |line_item|
      line_item = line_item.split(";")
      line_item = LineItem.new(line_item.first.to_i, Item.new(line_item.last))
      order.add_line_item(line_item)
      slip << "%d               %s   $%.2f           $%.2f" % [line_item.quantity, line_item.item_name, line_item.item_price, line_item.total]
    end
    slip << "Grand total: $%.2f" % [order.grand_total]

    puts slip.join("\n").chomp
  end


  def self.run
    self.new(*ARGV).print_packing_slip
  end

end

Runner.run

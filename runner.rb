require File.expand_path(File.dirname(__FILE__) + '/lib/item')
require File.expand_path(File.dirname(__FILE__) + '/lib/line_item')

class Runner


  def initialize(*args)
    @items = File.read("input.txt")
    @line_items = @items.split("\n")
  end


  def print_packing_slip
    slip = ["Qty             Item            Price Each        Total"]
    grand_total = 0
    @line_items.each do |line_item|
      line_item = line_item.split(";")
      line_item = LineItem.new(line_item.first.to_i, Item.new(line_item.last))
      grand_total += line_item.total
      slip << "#{line_item.quantity}               #{line_item.item_name}   $#{line_item.item_price}.00           $#{line_item.total}.00"
    end
    slip << "Grand total: $%.2f" % [grand_total]

    puts slip.join("\n").chomp
  end


  def self.run
    self.new(*ARGV).print_packing_slip
  end

end

Runner.run

require File.expand_path(File.dirname(__FILE__) + '/lib/item')

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
      qty = line_item.first.to_i
      item = Item.new(line_item.last)
      total = item.price * qty
      grand_total += total
      slip << "#{qty}               #{item.name}   $#{item.price}.00           $#{total}.00"
    end
    slip << "Grand total: $%.2f" % [grand_total]

    puts slip.join("\n").chomp
  end


  def self.run
    self.new(*ARGV).print_packing_slip
  end

end

Runner.run

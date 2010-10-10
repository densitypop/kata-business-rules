require File.expand_path(File.dirname(__FILE__) + '/lib/order')

class Runner


  def initialize(*args)
    @item = args.first
    @qty = args.last.to_i
  end


  def print_packing_slip
    slip = ["Qty             Item            Price Each        Total"]
    slip << "#{@qty}               #{@item}   $#{250}.00           $#{250*@qty}.00"
    puts slip.join("\n")
  end


  def self.run
    self.new(*ARGV).print_packing_slip
  end

end

Runner.run

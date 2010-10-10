require 'line_item'

describe LineItem do

  context "when purchasing 2 of an item that costs $50" do

    subject { LineItem.new(2, OpenStruct.new(name: "Item", price: 50)) }

    its(:quantity) { should == 2 }
    its(:item_name) { should == "Item" }
    its(:item_price) { should == 50 }

    its(:total) { should == 100 }

  end

end

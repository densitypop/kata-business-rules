require 'line_item'

describe LineItem do

  context "when purchasing 2 of an item that costs $50" do

    subject do
      item = OpenStruct.new(name: "Item", price: 50, indication: :an_indication)
      LineItem.new(2, item)
    end

    its(:quantity) { should == 2 }
    its(:item_name) { should == "Item" }
    its(:item_price) { should == 50 }
    its(:total) { should == 100 }


    context "with extra steps" do

      its(:item_indication) { should == :an_indication }

    end


  end

end

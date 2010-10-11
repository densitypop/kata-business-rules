require 'line_item'

describe LineItem do

  context "containing 2 items named Flux Capacitor that cost $50 each" do

    subject do
      item = OpenStruct.new(name: "Flux Capacitor", price: 50, indication: :an_indication)
      LineItem.new(2, item)
    end

    its(:quantity) { should == 2 }
    its(:item_name) { should == "Flux Capacitor" }
    its(:item_price) { should == 50 }
    its(:total) { should == 100 }


  end

  context "with extra steps" do

    subject do
      item = OpenStruct.new(indication: :an_indication)
      LineItem.new(1, item)
    end

    its(:item_indication) { should == :an_indication }

  end



end

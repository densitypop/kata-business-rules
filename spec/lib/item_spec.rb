require 'rspec/mocks'
require 'item'

class Item

  def datastore
    {"Item1" => 50}
  end
end


describe Item do

  context "named Item1 that costs $50.00" do

    subject { Item.new("Item1") }

    its(:name) { should == "Item1" }
    its(:price) { should == 50 }

  end
end

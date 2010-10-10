require 'rspec/mocks'
require 'item'

class Item

  def datastore
    {"Item1" => 50}
  end
end


describe Item do

  subject { Item.new("Item1") }

  its(:name) { should == "Item1" }
  its(:price) { should == 50 }
end

require 'rspec/mocks'
require 'item'

class Item

  def datastore
    {
      "Item1" => {price: 50},
      "ComplexItem" => {indication: "do something", price: 10}
    }
  end
end


RSpec::Matchers.define :have_an_indication do |expected|
  match do |actual|
    !actual.indication.nil?
  end
end

describe Item do

  context "named Item1 that costs $50.00" do

    subject { Item.new("Item1") }

    its(:name) { should == "Item1" }
    its(:price) { should == 50 }
    it { should_not have_an_indication }

  end


  context "that requires extra steps" do

    subject { Item.new("ComplexItem") }

    it { should have_an_indication }
  end
end

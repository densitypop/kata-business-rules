require 'rspec/mocks'
require 'item'

class Item

  def datastore
    {
      "Clocktower" => {price: 50},
      "DeLorean" => {indication: "install time travel circuits", price: 10}
    }
  end
end


RSpec::Matchers.define :have_an_indication do |expected|
  match do |actual|
    !actual.indication.nil?
  end
end

describe Item do

  context "named Clocktower that costs $50.00" do

    subject { Item.new("Clocktower") }

    its(:name) { should == "Clocktower" }
    its(:price) { should == 50 }
    it { should_not have_an_indication }

  end


  context "that requires extra steps" do

    subject { Item.new("DeLorean") }

    it { should have_an_indication }
  end
end

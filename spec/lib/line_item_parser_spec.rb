require 'rspec/mocks'
require 'line_item'
require 'line_item_parser'


describe LineItemParser do


  context "containing 2 items named Skateboard" do

    subject do
      LineItemParser.stub!(:build_item).and_return(OpenStruct.new(name: "Skateboard"))
      LineItemParser.parse("2;Skateboard")
    end

    its(:item_name) { should == "Skateboard" }
    its(:quantity) { should == 2 }

  end

end

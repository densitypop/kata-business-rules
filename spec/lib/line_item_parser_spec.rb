require 'line_item'
require 'line_item_parser'


describe LineItemParser do


  subject do
    LineItemParser.parse("2;Item")
  end

  its(:item) { should == "Item" }
  its(:quantity) { should == 2 }
end

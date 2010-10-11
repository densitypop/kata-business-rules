require 'order'

describe Order do


  context "when I place an order for 1 product that costs $200" do

    subject do
      line_item = OpenStruct.new(total: 200, item_indication: :an_indication)
      Order.new(line_item)
    end


    its(:grand_total) { should == 200 }

    it "takes additional line items" do
      line_item = OpenStruct.new(total: 50)
      subject.add_line_item(line_item)
      subject.grand_total.should == 250
    end


    it "dispatches to determine extra steps" do
      subject.stub!(:lookup_indication).
        with(:an_indication).
        and_return("extra steps")

      subject.dispatch.should == ["extra steps"]
    end

  end
end

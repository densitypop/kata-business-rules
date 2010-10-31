require 'order'


module IndicationDispatchers
  class AnIndication

    def initialize(order)
      @order = order
    end

    def run
      @order.indications << "extra steps"
    end

  end

  class AnotherIndication

    def initialize(order)
      @order = order
    end

    def run
      @order.indications << "more extra steps"
    end

  end
end



describe Order do


  context "placed for 1 product that costs $200" do

    subject do
      Order.new(OpenStruct.new(total: 200))
    end


    its(:grand_total) { should == 200 }

  end


  context "placed for 1 product that costs $100" do

    subject do
      line_item = OpenStruct.new(total: 100)
      Order.new(line_item)
    end

    context "with an extra $50 item" do

      before(:each) do
        line_item = OpenStruct.new(total: 50)
        subject.add_line_item(line_item)
      end


      its(:grand_total) do
        should == 150
      end

    end
  end


  context "placed for a product that requires an extra step" do

    subject do
      line_item = OpenStruct.new(item_indication: :an_indication)
      Order.new(line_item)
    end

    its(:indications) { should == ["extra steps"] }
  end


  context "placed for a product that requires two extra steps" do

    subject do
      line_item = OpenStruct.new(item_indication:
                                 [:an_indication, :another_indication])
      Order.new(line_item)
    end

    its(:indications) { should == ["extra steps", "more extra steps"] }

  end
end

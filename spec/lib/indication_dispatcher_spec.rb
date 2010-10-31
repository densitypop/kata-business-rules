require 'indication_dispatcher'

module IndicationDispatchers
  class MyDispatch
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def run
      "My Dispatch"
    end
  end
end

describe IndicationDispatcher do


  subject { IndicationDispatcher.new(:my_dispatch, OpenStruct.new) }

  its(:dispatch) { should == "My Dispatch" }
  its(:dispatch_instance) { should be_a(IndicationDispatchers::MyDispatch) }


  describe IndicationDispatchers::MyDispatch do


    before(:all) do
      @order = OpenStruct.new
    end

    let(:dispatcher) { IndicationDispatcher.new(:my_dispatch, @order) }
    subject { dispatcher.dispatch_instance }

    its(:order) { should == @order }

  end


end

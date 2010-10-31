$: << File.expand_path(File.dirname(__FILE__) + '/../../../lib')

require 'indication_dispatchers/send_copy_to_royalty_dept'


include IndicationDispatchers

class DummyOrder
  attr_accessor :indications

  def initialize
    @indications = []
  end

end

describe SendCopyToRoyaltyDept do

  before do
    @order = DummyOrder.new
    @dispatcher = SendCopyToRoyaltyDept.new(@order)
    @dispatcher.stub(:indication).and_return("copy sent")
  end

  it "adds a message to the order's indications" do
    @dispatcher.run
    @order.indications.should include("copy sent")
  end

end

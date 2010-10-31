$: << File.expand_path(File.dirname(__FILE__) + '/../../../lib')

require 'indication_dispatchers/free_first_aid_video'


include IndicationDispatchers

class FirstAidVideoOrder
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_line_item(line_item)
    @items << { line_item.item_name => {price: line_item.item_price} }
  end

end

describe FreeFirstAidVideo do

  before do

    Item.stub(:new).with("First Aid").
      and_return(OpenStruct.new(name: "First Aid", price: 0))

    @order = FirstAidVideoOrder.new
    @dispatcher = FreeFirstAidVideo.new(@order)
  end

  it "adds the first aid video item" do
    @dispatcher.run
    @order.items.should include("First Aid" => {price: 0})
  end

end


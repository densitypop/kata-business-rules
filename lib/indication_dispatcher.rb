require "#{File.dirname(__FILE__)}/indication_dispatchers"

class IndicationDispatcher
  attr_reader :dispatcher, :order

  def initialize(dispatcher, order)
    @dispatcher = dispatcher
    @order = order
  end

  def dispatch
    dispatch_instance.run
  end


  def dispatch_instance
    dispatcher_class = IndicationDispatchers.load_dispatcher(dispatcher)
    dispatcher_class.new(order)
  end


end

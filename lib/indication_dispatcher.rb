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
    class_name = dispatcher.to_s[0].upcase +
      dispatcher.to_s[1..-1].gsub(/_(.)/) { $1.upcase }

    dispatcher_class = self.class.const_get(class_name)
    dispatcher_class.new(order)
  end


end

module IndicationDispatchers
  class GenerateCommissionPayment

    def initialize(order)
      @order = order
    end


    def run
      @order.indications << indication
    end


    def indication
      "The sales agent has received a commission payment"
    end


  end
end



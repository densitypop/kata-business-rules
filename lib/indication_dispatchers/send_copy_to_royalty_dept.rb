module IndicationDispatchers
  class SendCopyToRoyaltyDept

    def initialize(order)
      @order = order
    end


    def run
      @order.indications << indication
    end


    def indication
      "A copy of the packing slip was sent to the royalty department"
    end


  end
end


module IndicationDispatchers
  class UpgradeMember

    def initialize(order)
      @order = order
    end


    def run
      @order.indications << indication
    end


    def indication
      "Your membership has been upgraded. We have sent you an email confirming your upgrade."
    end


  end
end



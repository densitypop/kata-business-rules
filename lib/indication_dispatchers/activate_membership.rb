module IndicationDispatchers
  class ActivateMembership

    def initialize(order)
      @order = order
    end


    def run
      @order.indications << indication
    end


    def indication
      "Your membership has been activated. We have sent you an email confirming your request."
    end


  end
end



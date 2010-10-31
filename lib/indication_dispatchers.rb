require File.dirname(__FILE__) + '/indication_dispatchers/generate_commission_payment'
require File.dirname(__FILE__) + '/indication_dispatchers/send_copy_to_royalty_dept'
require File.dirname(__FILE__) + '/indication_dispatchers/free_first_aid_video'
require File.dirname(__FILE__) + '/indication_dispatchers/activate_membership'
require File.dirname(__FILE__) + '/indication_dispatchers/upgrade_member'

module IndicationDispatchers

  def load_dispatcher(dispatcher)

    class_name = dispatcher.to_s[0].upcase +
      dispatcher.to_s[1..-1].gsub(/_(.)/) { $1.upcase }

    IndicationDispatchers.const_get(class_name)

  end

  module_function :load_dispatcher


end

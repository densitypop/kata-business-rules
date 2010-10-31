class Item
  attr_reader :name, :price, :indication

  def initialize(name)
    @name = name
    raise "The item named \"#{name}\" does not exist." unless datastore.key?(name)
    @price = datastore[name][:price]
    @indication = datastore[name][:indication]
  end


  def datastore
    {
      "Widget X 2000" => {price: 250, indication: :generate_commission_payment},
      "Widget Y 2010" => {price: 500, indication: :generate_commission_payment},
      "Blink"         => {price: 3, indication: [:send_copy_to_royalty_dept, :generate_commission_payment]},
      "Membership"    => {price: 250, indication: :activate_membership},
      "Upgrade Member" => {price: 100, indication: :upgrade_member},
      "Learning to Ski" => {price: 15, indication: :free_first_aid_video},
      "First Aid" => {price: 0}
    }
  end

end

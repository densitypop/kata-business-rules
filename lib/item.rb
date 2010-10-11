class Item
  attr_reader :name, :price, :indication

  def initialize(name)
    @name = name
    @price = datastore[name][:price]
    @indication = datastore[name][:indication]
  end


  def datastore
    {
      "Widget X 2000" => {price: 250},
      "Widget Y 2010" => {price: 500},
      "Blink"         => {price: 3, indication: :send_copy_to_royalty_dept},
      "Membership"    => {price: 250, indication: :activate_membership},
      "Upgrade Member" => {price: 100, indication: :upgrade_member}
    }
  end

end

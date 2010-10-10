class Item
  attr_reader :name, :price

  def initialize(name)
    @name = name
    @price = datastore[name]
  end


  def datastore
    {"Widget X 2000" => 250, "Widget Y 2010" => 500}
  end

end

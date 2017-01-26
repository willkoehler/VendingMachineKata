class ProductDispenser
  
  Inventory = [ :cola, :chips, :candy ]
  
  def initialize
    @bin_contents = []
  end
  
  def dispense(product)
    @bin_contents << product if Inventory.include?(product)
  end
  
  def check_bin
    @bin_contents
  end
end

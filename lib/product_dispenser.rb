class ProductDispenser
  
  Inventory = {
    cola: 1.00,
    chips: 0.50,
    candy: 0.65
  }
  
  def initialize
    @bin_contents = []
  end
  
  def dispense(product)
    @bin_contents << product if Inventory.include?(product)
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end
end

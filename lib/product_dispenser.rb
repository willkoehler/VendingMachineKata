class ProductDispenser
  
  def initialize
    @bin_contents = []
  end
  
  def dispense(product)
    @bin_contents << product
  end
  
  def check_bin
    @bin_contents
  end
end

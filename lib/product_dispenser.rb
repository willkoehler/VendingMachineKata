class ProductDispenser
  
  Products = {
    cola: 1.00,
    chips: 0.50,
    candy: 0.65
  }
  
  def initialize
    @bin_contents = []
  end
  
  def dispense(product, cash_inserted)
    if Products[product] && Products[product] <= cash_inserted
      @bin_contents << product if Products.include?(product)
    end
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end
end

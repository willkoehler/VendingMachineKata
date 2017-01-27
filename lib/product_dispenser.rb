class ProductDispenser
  
  Products = {
    cola: { price: 1.00 },
    chips: { price: 0.50 },
    candy: { price: 0.65 }
  }
  
  def initialize
    @bin_contents = []
  end
  
  def dispense(product, cash_inserted)
    if Products[product] && Products[product][:price] > cash_inserted
      Products[product][:price]
    else
      @bin_contents << product if Products.include?(product)
    end
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end
end

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
    if !Products[product]
      { result: :not_found }
    elsif Products[product][:price] > cash_inserted
      { result: :insufficient_cash, price: Products[product][:price] }
    else
      @bin_contents << product
      { result: :success }
    end
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end
end

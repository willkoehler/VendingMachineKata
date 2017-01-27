require 'bigdecimal'

class ProductDispenser
  
  Products = {
    cola: { price: BigDecimal.new(1.00, 2) },
    chips: { price: BigDecimal.new(0.50, 2) },
    candy: { price: BigDecimal.new(0.65, 2) }
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
      { result: :success, change_due: cash_inserted - Products[product][:price] }
    end
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end
end

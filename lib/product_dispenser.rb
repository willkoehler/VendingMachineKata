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
      put_in_bin(product)
      { result: :success, change_due: cash_inserted - Products[product][:price] }
    end
  end
  
  def check_bin
    @bin_contents.pop(@bin_contents.size)
  end

  private

    # In a real vending machine, the product dispenser bin would be a physical thing
    # and we wouldn't need to track it's contents or have a function to check it's
    # contents. But for this exercise, we are going to model the bin in code.
    def put_in_bin(product)
      @bin_contents << product
    end
end

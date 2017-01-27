class Display

  def initialize
    @contents = 'INSERT COIN'
  end

  def show_total_cash_inserted(total)
    @contents = "$%.2f" % [total]
  end
  
  def show_price(price)
    @contents = "PRICE $%.2f" % [price]
  end

  def read
    current_contents = @contents
    @contents='INSERT COIN'
    current_contents
  end
end
class Display

  def initialize
    @contents = 'INSERT COIN'
    set_default_contents(@contents)
  end

  def show_total_cash_inserted(total)
    @contents = "$%.2f" % [total]
    set_default_contents(@contents)
  end
  
  def show_price(price)
    @contents = "PRICE $%.2f" % [price]
  end
  
  def end_of_transaction
    @contents = 'THANK YOU'
    set_default_contents('INSERT COIN')
  end

  def read
    current_contents = @contents
    @contents=@default_contents
    current_contents
  end
  
  private
  
    # This is a simple implementation of what may eventually become a state machine
    def set_default_contents(text)
      @default_contents = text
    end
end
require 'bigdecimal'

class CoinBox
  
  attr_reader :total
  Quarter = { weight: :quarter_weight, size: :quarter_size }
  Dime = { weight: :dime_weight, size: :dime_size }
  Nickel = { weight: :nickel_weight, size: :nickel_size }
  
  def initialize
    @total = BigDecimal.new(0)
    @coin_return_contents = []
  end
  
  def insert_coin(coin)
    case coin
    when Nickel
      @total += 0.05
    when Dime
      @total += 0.10
    when Quarter
      @total += 0.25
    else
      put_in_coin_return(coin)
    end
  end
  
  def check_coin_return
    @coin_return_contents.pop(@coin_return_contents.size)
  end
  
  def make_change(amount)
    remaining = BigDecimal(amount, 2)
    remaining -= next_coin_for_change(remaining) while remaining > 0
  end
  
  private

    # In a real vending machine, the coin return would be a physical thing and we
    # wouldn't need to track it's contents or have a function to check it's contents.
    # But for this exercise, we are going to model a coin return in code.
    def put_in_coin_return(coin)
      @coin_return_contents << coin
    end
    
    def next_coin_for_change(remaining)
      if remaining >= 0.25
        put_in_coin_return Quarter
        0.25
      elsif remaining >= 0.10
        put_in_coin_return Dime
        0.10
      else
        put_in_coin_return Nickel
        0.05
      end
    end
end
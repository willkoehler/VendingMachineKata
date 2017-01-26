class CoinBox
  
  attr_reader :total
  
  def initialize
    @total = 0
    @coin_return_contents = []
  end
  
  def insert_coin(coin)
    case coin
    when { weight: :nickel_weight, size: :nickel_size }
      @total += 0.05
    when { weight: :dime_weight, size: :dime_size }
      @total += 0.10
    when { weight: :quarter_weight, size: :quarter_size }
      @total += 0.25
    else
      put_in_coin_return(coin)
    end
  end
  
  def check_coin_return
    coin_return_copy = @coin_return_contents.clone
    @coin_return_contents.clear
    coin_return_copy
  end
  
  private

    # In a real vending machine, the coin return would be a physical thing and we
    # wouldn't need to track it's contents or have a function to check it's contents.
    # But for this exercise, we are going to model a coin return in code.
    def put_in_coin_return(coin)
      @coin_return_contents << coin
    end
end
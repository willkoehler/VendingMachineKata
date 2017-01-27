class CoinBox
  
  attr_reader :total
  Quarter = { weight: :quarter_weight, size: :quarter_size }
  Dime = { weight: :dime_weight, size: :dime_size }
  Nickel = { weight: :nickel_weight, size: :nickel_size }
  
  def initialize
    @total = 0
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
  
  private

    # In a real vending machine, the coin return would be a physical thing and we
    # wouldn't need to track it's contents or have a function to check it's contents.
    # But for this exercise, we are going to model a coin return in code.
    def put_in_coin_return(coin)
      @coin_return_contents << coin
    end
end
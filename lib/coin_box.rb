class CoinBox
  
  attr_reader :total
  
  def initialize
    @total = 0
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
      # TODO reject coin
    end
  end
end
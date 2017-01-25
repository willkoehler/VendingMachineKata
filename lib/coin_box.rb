class CoinBox
  
  attr_reader :total
  
  def initialize
    @total = 0
  end
  
  def insert_coin(coin)
    @total += 0.05
  end
end
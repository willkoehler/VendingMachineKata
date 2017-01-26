# VendingMachine is the public interface of the vending machine.

require 'display'
require 'coin_box'

class VendingMachine
  
  def initialize
    @display = Display.new
    @coin_box = CoinBox.new
  end
  
  def read_display
    @display.read
  end
  
  def insert_coin(coin)
    @coin_box.insert_coin(coin)
    @display.show_total_cash_inserted(@coin_box.total)
  end
  
  def check_coin_return
    @coin_box.check_coin_return
  end
end
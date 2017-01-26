require 'forwardable'
require 'display'
require 'coin_box'

class VendingMachine
  extend Forwardable
  
  delegate [:check_coin_return] => :@coin_box
  
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
end
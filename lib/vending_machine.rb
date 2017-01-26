require 'forwardable'
require 'display'
require 'coin_box'

class VendingMachine
  extend Forwardable
  
  delegate [:insert_coin, :check_coin_return] => :@coin_box
  
  def initialize
    @display = Display.new
    @coin_box = CoinBox.new
  end
  
  def read_display
    @display.read
  end
end
# VendingMachine is the public interface of the vending machine.

require 'display'
require 'coin_box'
require 'product_dispenser'

class VendingMachine
  
  def initialize
    @display = Display.new
    @coin_box = CoinBox.new
    @dispenser = ProductDispenser.new
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
  
  def check_dispenser_bin
    @dispenser.check_bin
  end

  def press_cola_button() press_button(:cola) end
  def press_chips_button() press_button(:chips) end

  private
  
    def press_button(button)
      result = @dispenser.dispense(button, @coin_box.total)
      if result[:result] == :success
        @display.show_thank_you
      else
        @display.show_price(result[:price])
      end
    end
  
end
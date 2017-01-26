require 'display'

class VendingMachine
  
  def initialize
    @display = Display.new
  end
  
  def read_display
    @display.read
  end
end
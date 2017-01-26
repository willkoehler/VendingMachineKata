require 'display'

describe Display do
  let(:display) { Display.new }
  
  describe "#read" do
    it "should read 'INSERT COIN' when initialized" do
      expect(display.read).to eq('INSERT COIN')
    end
  end
  
  describe "#show_total_cash_inserted" do
    it "should update the display with the total cash inserted" do
      display.show_total_cash_inserted(0.55)
      expect(display.read).to eq('$0.55')
      display.show_total_cash_inserted(1.15)
      expect(display.read).to eq('$1.15')
    end
  end
end

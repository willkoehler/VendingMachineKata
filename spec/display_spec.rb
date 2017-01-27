require 'display'

describe Display do
  let(:display) { Display.new }
  
  describe "#read" do
    it "should read 'INSERT COIN' when initialized" do
      expect(display.read).to eq('INSERT COIN')
    end
  end
  
  describe "#show_total_cash_inserted" do
    it "should show total cash inserted on the display" do
      display.show_total_cash_inserted(0.55)
      expect(display.read).to eq('$0.55')
      display.show_total_cash_inserted(1.15)
      expect(display.read).to eq('$1.15')
    end
  end
  
  describe "#show_price" do
    it "should show a product price on the display" do
      display.show_price(0.65)
      expect(display.read).to eq('PRICE $0.65')
    end
  end
  
  describe "#end_of_transaction" do
    it "should read 'THANK YOU' on the display" do
      display.end_of_transaction
      expect(display.read).to eq('THANK YOU')
    end
  end
  
  describe "display state" do
    context "when no money has been inserted" do
      it "should read INSERT COIN the next time it's read after product price is displayed" do
        display.show_price(0.65)
        expect(display.read).to eq('PRICE $0.65')
        expect(display.read).to eq('INSERT COIN')
        expect(display.read).to eq('INSERT COIN')
      end
    end
    context "when money has been inserted" do
      before { display.show_total_cash_inserted(0.55) }
      it "should show total cash inserted the next time it's read after product price is displayed" do
        display.show_price(0.65)
        expect(display.read).to eq('PRICE $0.65')
        expect(display.read).to eq('$0.55')
        expect(display.read).to eq('$0.55')
      end
    end
    it "should read 'INSERT COIN' the next time it's read after the end of a transaction" do
      display.end_of_transaction
      expect(display.read).to eq('THANK YOU')
      expect(display.read).to eq('INSERT COIN')
      expect(display.read).to eq('INSERT COIN')
    end
  end
end

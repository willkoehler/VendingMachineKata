require 'product_dispenser'

describe ProductDispenser do
  let(:dispenser) { ProductDispenser.new }
  
  describe "#dispense" do
    it "should dispense cola to the bin" do
      expect(dispenser.dispense(:cola, 1.00)).to eq({ result: :success })
      expect(dispenser.check_bin).to eq([:cola])
    end

    it "should dispense chips to the bin" do
      expect(dispenser.dispense(:chips, 0.50)).to eq({ result: :success })
      expect(dispenser.check_bin).to eq([:chips])
    end

    it "should dispense candy to the bin" do
      expect(dispenser.dispense(:candy, 0.65)).to eq({ result: :success })
      expect(dispenser.check_bin).to eq([:candy])
    end
  
    it "should only dispense products that the vending machine sells" do
      expect(dispenser.dispense(:tofu, 100)).to eq({ result: :not_found })
      expect(dispenser.check_bin).to eq([])
    end

    it "should only dispense a product when sufficient cash has been inserted" do
      dispenser.dispense(:cola, 0.99)
      expect(dispenser.check_bin).to eq([])
      dispenser.dispense(:cola, 1.00)
      expect(dispenser.check_bin).to eq([:cola])
    end
    
    it "should return the product price when insufficient cash has been inserted" do
      expect(dispenser.dispense(:cola, 0.75)).to eq({ result: :insufficient_cash, price: 1.00 })
      expect(dispenser.dispense(:chips, 0.45)).to eq({ result: :insufficient_cash, price: 0.50 })
    end
  end
  
  describe "#check_bin" do
    it "should clear the contents of the bin" do
      dispenser.dispense(:cola, 1.00)
      expect(dispenser.check_bin).to eq([:cola])
      expect(dispenser.check_bin).to eq([])
    end
  end
end
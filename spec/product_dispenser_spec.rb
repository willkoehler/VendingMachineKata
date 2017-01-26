require 'product_dispenser'

describe ProductDispenser do
  let(:dispenser) { ProductDispenser.new }
  
  describe "#dispense" do
    it "should dispense cola to the bin" do
      dispenser.dispense(:cola)
      expect(dispenser.check_bin).to eq([:cola])
    end

    it "should dispense chips to the bin" do
      dispenser.dispense(:chips)
      expect(dispenser.check_bin).to eq([:chips])
    end

    it "should dispense candy to the bin" do
      dispenser.dispense(:candy)
      expect(dispenser.check_bin).to eq([:candy])
    end
  
    it "should only dispense products that the vending machine sells" do
      dispenser.dispense(:tofu)
      expect(dispenser.check_bin).to eq([])
    end
  end
  
  describe "#check_bin" do
    it "should clear the contents of the bin" do
      dispenser.dispense(:cola)
      expect(dispenser.check_bin).to eq([:cola])
      expect(dispenser.check_bin).to eq([])
    end
  end
end
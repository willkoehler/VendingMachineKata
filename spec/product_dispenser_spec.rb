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
  end
end
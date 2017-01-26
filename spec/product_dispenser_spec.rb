require 'product_dispenser'

describe ProductDispenser do
  let(:dispenser) { ProductDispenser.new }
  
  describe "#dispense" do
    it "should dispense cola to the bin" do
      dispenser.dispense(:cola)
      expect(dispenser.check_bin).to eq([:cola])
    end
  end
end
require 'vending_machine'

# Integration tests

describe VendingMachine do
  let(:vending_machine) { VendingMachine.new }
  
  it "should have a display" do
    expect(vending_machine.read_display).to eq('INSERT COIN')
  end
  
end

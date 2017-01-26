require 'vending_machine'

# Integration tests

describe VendingMachine do
  let(:vending_machine) { VendingMachine.new }
  
  it "should have a display" do
    expect(vending_machine.read_display).to eq('INSERT COIN')
  end
  
  it "should have a coin slot and coin return" do
    vending_machine.insert_coin(weight: :nickel_weight, size: :nickel_size)
    vending_machine.insert_coin(weight: :penny_weight, size: :penny_size)
    expect(vending_machine.check_coin_return).to eq([{ weight: :penny_weight, size: :penny_size }])
  end
end

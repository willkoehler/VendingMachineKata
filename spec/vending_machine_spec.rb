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
  
  it "should update the display when coins are inserted" do
    expect(vending_machine.read_display).to eq('INSERT COIN')
    vending_machine.insert_coin(weight: :nickel_weight, size: :nickel_size)
    expect(vending_machine.read_display).to eq('$0.05')
    vending_machine.insert_coin(weight: :dime_weight, size: :dime_size)
    expect(vending_machine.read_display).to eq('$0.15')
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    expect(vending_machine.read_display).to eq('$0.40')
  end
end

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
  
  it "should allow customer to buy a cola" do
    # Start of transaction
    expect(vending_machine.read_display).to eq('INSERT COIN')
    # Try to buy a cola without inserting money
    vending_machine.press_cola_button
    expect(vending_machine.read_display).to eq('PRICE $1.00')
    expect(vending_machine.read_display).to eq('INSERT COIN')
    # Insert a quarter and attempt to buy cola again
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    expect(vending_machine.read_display).to eq('$0.25')
    vending_machine.press_cola_button
    expect(vending_machine.read_display).to eq('PRICE $1.00')
    expect(vending_machine.read_display).to eq('$0.25')
    # Insert sufficient cash for the cola and buy it
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    vending_machine.insert_coin(weight: :dime_weight, size: :dime_size)
    vending_machine.insert_coin(weight: :dime_weight, size: :dime_size)
    vending_machine.insert_coin(weight: :nickel_weight, size: :nickel_size)
    expect(vending_machine.read_display).to eq('$1.00')
    vending_machine.press_cola_button
    expect(vending_machine.read_display).to eq('THANK YOU')
    expect(vending_machine.check_dispenser_bin).to eq([:cola])
  end

  it "should allow customer to buy chips" do
    # Start of transaction
    expect(vending_machine.read_display).to eq('INSERT COIN')
    # Try to buy chips without inserting money
    vending_machine.press_chips_button
    expect(vending_machine.read_display).to eq('PRICE $0.50')
    expect(vending_machine.read_display).to eq('INSERT COIN')
    # Insert sufficient cash for the chips and buy them
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    vending_machine.insert_coin(weight: :quarter_weight, size: :quarter_size)
    expect(vending_machine.read_display).to eq('$0.50')
    vending_machine.press_chips_button
    expect(vending_machine.read_display).to eq('THANK YOU')
    expect(vending_machine.check_dispenser_bin).to eq([:chips])
  end
end

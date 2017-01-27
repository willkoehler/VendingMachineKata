require 'coin_box'

describe CoinBox do
  let(:coin_box) { CoinBox.new }
  
  describe "#reset" do
    it "should reset the total" do
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      expect(coin_box.total).to eq(0.05)
      coin_box.reset
      expect(coin_box.total).to eq(0)
    end
    it "should not effect the contents of the coin return" do
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      coin_box.reset
      expect(coin_box.check_coin_return).to eq([{ weight: :penny_weight, size: :penny_size }])
    end
  end
  
  describe "#insert_coin" do
    it "should increment total by 0.05 when a nickel is inserted" do
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      expect(coin_box.total).to eq(0.05)
    end

    it "should increment total by 0.05 for each nickel that's inserted" do
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      expect(coin_box.total).to eq(0.10)
    end

    it "should increment total by 0.10 when a dime is inserted" do
      coin_box.insert_coin(weight: :dime_weight, size: :dime_size)
      expect(coin_box.total).to eq(0.10)
    end

    it "should increment total by 0.10 for each dime that's inserted" do
      coin_box.insert_coin(weight: :dime_weight, size: :dime_size)
      coin_box.insert_coin(weight: :dime_weight, size: :dime_size)
      expect(coin_box.total).to eq(0.20)
    end

    it "should increment total by 0.25 when a quarter is inserted" do
      coin_box.insert_coin(weight: :quarter_weight, size: :quarter_size)
      expect(coin_box.total).to eq(0.25)
    end

    it "should increment total by 0.25 for each quarter that's inserted" do
      coin_box.insert_coin(weight: :quarter_weight, size: :quarter_size)
      coin_box.insert_coin(weight: :quarter_weight, size: :quarter_size)
      expect(coin_box.total).to eq(0.50)
    end
    
    it "should reject pennies" do
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      expect(coin_box.total).to eq(0)
    end
    
    it "should reject counterfeit coins" do
      coin_box.insert_coin(weight: :counterfeit_weight, size: :quarter_size)
      coin_box.insert_coin(weight: :quarter_weight, size: :counterfeit_size)
      expect(coin_box.total).to eq(0)
    end
    
    it "should accepts a combination of coins" do
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      expect(coin_box.total).to eq(0.05)
      coin_box.insert_coin(weight: :nickel_weight, size: :nickel_size)
      expect(coin_box.total).to eq(0.10)
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      expect(coin_box.total).to eq(0.10)
      coin_box.insert_coin(weight: :dime_weight, size: :dime_size)
      expect(coin_box.total).to eq(0.20)
      coin_box.insert_coin(weight: :counterfeit_weight, size: :quarter_size)
      expect(coin_box.total).to eq(0.20)
      coin_box.insert_coin(weight: :quarter_weight, size: :quarter_size)
      expect(coin_box.total).to eq(0.45)
      coin_box.insert_coin(weight: :quarter_weight, size: :quarter_size)
      expect(coin_box.total).to eq(0.70)
    end
  end
  
  describe "#coin_return" do
    it "should contain rejected coins" do
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      expect(coin_box.check_coin_return).to eq([{ weight: :penny_weight, size: :penny_size }])
    end

    it "should hold multiple rejected coins" do
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      coin_box.insert_coin(weight: :counterfeit_weight, size: :quarter_size)
      expect(coin_box.check_coin_return).to eq([
        { weight: :penny_weight, size: :penny_size },
        { weight: :counterfeit_weight, size: :quarter_size }
      ])
    end
    
    it "should clear the contents of the coin return" do
      coin_box.insert_coin(weight: :penny_weight, size: :penny_size)
      expect(coin_box.check_coin_return).to eq([{ weight: :penny_weight, size: :penny_size }])
      expect(coin_box.check_coin_return).to eq([])
    end
  end
  
  describe "#return_change" do
    it "should put requested change in the coin return" do
      coin_box.make_change(0.05)
      expect(coin_box.check_coin_return).to eq([
        { weight: :nickel_weight, size: :nickel_size }
      ])
    end
    it "should use quarters, nickels, and dimes to make change" do
      coin_box.make_change(0.40)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :dime_weight, size: :dime_size },
        { weight: :nickel_weight, size: :nickel_size }
      ])
    end
    it "should make change using the largest coins possible" do
      coin_box.make_change(0.50)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size }
      ])
      coin_box.make_change(0.55)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :nickel_weight, size: :nickel_size }
      ])
      coin_box.make_change(0.60)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :dime_weight, size: :dime_size }
      ])
      coin_box.make_change(0.65)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :dime_weight, size: :dime_size },
        { weight: :nickel_weight, size: :nickel_size }
      ])
      coin_box.make_change(0.70)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :dime_weight, size: :dime_size },
        { weight: :dime_weight, size: :dime_size }
      ])
      coin_box.make_change(0.75)
      expect(coin_box.check_coin_return).to eq([
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size },
        { weight: :quarter_weight, size: :quarter_size }
      ])
    end
    it "shouldn't make change if no change is due" do
      coin_box.make_change(0)
      expect(coin_box.check_coin_return).to eq([])
    end
  end
end
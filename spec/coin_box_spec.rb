require 'coin_box'

describe CoinBox do
  let(:coin_box) { CoinBox.new }
  
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
  
end
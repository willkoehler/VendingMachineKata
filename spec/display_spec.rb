require 'display'

describe Display do
  let(:display) { Display.new }
  
  describe "#read" do
    it "should read 'INSERT COIN' when initialized" do
      expect(display.read).to eq('INSERT COIN')
    end
  end
end

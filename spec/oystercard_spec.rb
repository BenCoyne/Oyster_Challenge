require 'oystercard'

describe OysterCard do
  subject(:oystercard) { described_class.new }
  # In order to use public transport
  # As a customer
  # I want money on my card
  describe "#balance" do 

    it { is_expected.to respond_to(:balance) }

    it "has a default balance (£DEFAULT_CAPACITY)" do
      expect(oystercard.balance).to eq(OysterCard::DEFAULT_CAPACITY)
    end
  end
end
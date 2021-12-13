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

  describe '#top_up' do
  # In order to use public transport
  # As a customer
  # I want money on my card
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can be topped up by a specified amount" do
      expect(oystercard.top_up(10)).to eq(10)
    end

    context "when the oyster balance is greater than BALANCE_LIMIT" do
      it "raises an error" do
        expect { oystercard.top_up(91) }.to raise_error "ERROR: MAX-BALANCE IS #{OysterCard::BALANCE_LIMIT}"
      end
    end
  end

  describe "#deduct" do
    # In order to pay for my journey
    # As a customer
    # I need my fare deducted from my card
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "can deduct a specified amount" do
      oystercard.top_up(20)
      expect(oystercard.deduct(10)).to eq(10)
    end
  end
end
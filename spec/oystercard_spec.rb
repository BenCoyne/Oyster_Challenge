require 'oystercard'
require 'journey'

describe OysterCard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it { is_expected.to respond_to(:balance) }

  it "has a default balance (DEFAULT_CAPACITY)" do
    expect(oystercard.balance).to eq(OysterCard::DEFAULT_BALANCE)
  end

  describe '#top_up' do
  # In order to use public transport
  # As a customer
  # I want money on my card
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can be topped up by a specified amount" do
      expect(oystercard.top_up(10)).to eq(10)
    end

    context "when the oyster balance is greater than MAX_BALANCE" do
      it "raises an error" do
        expect { oystercard.top_up(91) }.to raise_error "ERROR: MAX-BALANCE IS #{OysterCard::MAX_BALANCE}"
      end
    end
  end


  describe "touch_in" do

    it { is_expected.to respond_to(:touch_in).with(1).argument }
    # In order to pay for my journey
    # As a customer
    # I need to have the minimum amount (£1) for a single journey.
    it "raises error if balance < 1"  do
      expect { oystercard.touch_in(station) }.to raise_error "ERROR: INSUFFICIENT FUNDS FOR TOUCH_IN"
    end
  end

  describe "touch_out" do

    it { is_expected.to respond_to(:touch_out).with(1).argument }

    context "oystercard at max-balance" do
      before{oystercard.top_up(OysterCard::MAX_BALANCE)}
      before{oystercard.touch_in(station)}

      it "after touch_out journey_history not empty" do
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journey_history).to_not be_empty
      end

      # In order to pay for my journey
      # As a customer
      # When my journey is complete, I need the correct amount deducted from my card
      it "charges the minimum fair" do
        expect{ oystercard.touch_out(station) }.to change{ oystercard.balance }.by -(OysterCard::MIN_TOUCH_IN_BALANCE)
      end
    end
  end

  describe "#journey_history" do
    it { is_expected.to respond_to(:journey_history) }

    it "starts empty" do
      expect(oystercard.journey_history).to be_empty
    end
  end
end
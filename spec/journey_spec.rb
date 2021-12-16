require "journey"

describe Journey do

  let(:station1) { double(:station) }
  let(:station2) { double(:station) }
  context "when journey complete" do
    before do 
      subject.entry_station = station1
      subject.exit_station = station2
    end

    it "starts with an entry station" do
      expect(subject.entry_station).to eq station1
    end

    it "ends a journey" do
      expect(subject.exit_station).to eq station2
    end

    describe "#finish_journey" do
      it "returns a hash with the journey" do
        expect(subject.finish_journey).to eq({start: station1, finish: station2 })
      end
    end

    describe "#fare" do
      it "charges min fare" do
        expect(subject.fare).to eq 1
      end
    end
  end

  context "mid journey" do
    before { subject.entry_station = station1 }

    it "checks if card is in journey" do
      expect(subject).to be_in_journey
    end

    describe "#fare" do
      it "charges min fare" do
        expect(subject.fare).to eq 6
      end
    end
  end
end
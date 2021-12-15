require 'stations'

describe Station do
  subject(:station) { described_class.new("King's Cross", 1) }
  
  it "has a name" do
    expect(station.name).to eq("King's Cross")
  end

  it "has a zone" do
    expect(station.zone).to eq(1)
  end
end
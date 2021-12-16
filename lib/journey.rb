class Journey
  attr_accessor :entry_station, :exit_station
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end
  
  def finish_journey
    {start: entry_station, finish: exit_station }
  end

  def in_journey?
    true if @entry_station
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      return 6
    else
      return 1
    end
  end

  # def fare
  #   @entry_station == nil || @exit_station == nil ? PENALTY_FARE : 1
  # end

end

# my_journey = Journey.new
# my_journey.exit_station = "South"
# puts my_journey.finish_journey
# puts my_journey.fare
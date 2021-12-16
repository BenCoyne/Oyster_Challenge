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
    return 6 if (!@entry_station or !@exit_station)
    1
  end
  
end

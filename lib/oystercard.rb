class OysterCard
  DEFAULT_BALANCE = 0
  MIN_TOUCH_IN_BALANCE = 1
  MAX_BALANCE = 90

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    @amount = amount
    raise "ERROR: MAX-BALANCE IS #{MAX_BALANCE}" if limit?

    @balance += amount
  end

  def touch_in(station)
    raise 'ERROR: INSUFFICIENT FUNDS FOR TOUCH_IN' if balance < MIN_TOUCH_IN_BALANCE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_TOUCH_IN_BALANCE)
    @exit_station = station
    journey_maker(entry_station, exit_station)
    @entry_station = nil
  end

  def journey_maker(entry_station, exit_station)
    journey_history << {in: entry_station, out: exit_station }
  end

  def in_journey?
    @entry_station != nil && @exit_station == nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def limit?
    @balance + @amount > MAX_BALANCE
  end
end

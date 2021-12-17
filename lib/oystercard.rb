require_relative 'journey'

class OysterCard
  DEFAULT_BALANCE = 0
  MIN_TOUCH_IN_BALANCE = 1
  MAX_BALANCE = 90

  attr_reader :balance, :exit_station, :journey_history, :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_history = []
  end

  def top_up(amount)
    @amount = amount
    raise "ERROR: MAX-BALANCE IS #{MAX_BALANCE}" if limit?

    @balance += amount
  end

  def touch_in(station)
    raise 'ERROR: INSUFFICIENT FUNDS FOR TOUCH_IN' if balance < MIN_TOUCH_IN_BALANCE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.exit_station = station
    journey_maker
    deduct(@journey.fare)
  end

  def journey_maker
    journey_history << journey.finish_journey 
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def limit?
    @balance + @amount > MAX_BALANCE
  end
end



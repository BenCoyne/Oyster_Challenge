class OysterCard
  DEFAULT_BALANCE = 0
  MIN_TOUCH_IN_BALANCE = 1
  MAX_BALANCE = 90

  attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
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

  def touch_out
    deduct(MIN_TOUCH_IN_BALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def limit?
    @balance + @amount > MAX_BALANCE
  end
end

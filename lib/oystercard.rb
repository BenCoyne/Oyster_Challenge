class OysterCard
  DEFAULT_CAPACITY = 0
  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize(balance = DEFAULT_CAPACITY)
    @balance = balance
  end

  def top_up(amount)
    raise "ERROR: MAX-BALANCE IS #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end

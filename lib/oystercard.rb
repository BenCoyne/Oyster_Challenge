class OysterCard
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  attr_reader :balance, :travelling

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @travelling = false
  end

  def top_up(amount)
    raise "ERROR: MAX-BALANCE IS #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in 
    @travelling = true
  end
  
  def touch_out
    @travelling = false
  end
 
  def in_journey?
    @travelling
  end

end

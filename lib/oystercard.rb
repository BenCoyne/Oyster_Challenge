class OysterCard
  DEFAULT_BALANCE = 0
  MIN_TOUCH_IN_BALANCE = 1
  BALANCE_LIMIT = 90
  
  attr_reader :balance, :travelling

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @travelling = false
  end

  def top_up(amount)
    @amount = amount
    raise "ERROR: MAX-BALANCE IS #{BALANCE_LIMIT}" if limit?
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "ERROR: INSUFFICIENT FUNDS FOR TOUCH_IN" if balance < MIN_TOUCH_IN_BALANCE
    @travelling = true
  end
  
  def touch_out
    @travelling = false
  end
 
  def in_journey?
    @travelling
  end

  private

  def limit?
    @balance + @amount > BALANCE_LIMIT
  end

end

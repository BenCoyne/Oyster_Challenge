class OysterCard
  DEFAULT_CAPACITY = 0
  attr_reader :balance
  def initialize(balance = DEFAULT_CAPACITY)
    @balance = balance
  end
end

my_card = OysterCard.new(10)

my_card.balance


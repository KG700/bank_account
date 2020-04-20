class Transaction

  attr_reader :amount

  def initialize(amount, type, date)
    @amount = amount
  end

end

class Transaction

  attr_reader :amount, :type, :date, :balance

  def initialize(amount, type, date, balance)
    @amount = amount
    @type = type
    @date = date
    @balance = balance
  end

  def credit?
    @type == 'credit'
  end

end

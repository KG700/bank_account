class Transaction

  attr_reader :amount, :type, :date

  def initialize(amount, type, date)
    @amount = amount
    @type = type
    @date = date
    # @balance = balance
  end

  def credit?
    @type == 'credit'
  end

end

class Transaction

  attr_reader :amount, :type

  def initialize(amount, type, date)
    @amount = amount
    @type = type
  end

end

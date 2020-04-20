class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(money, date)
    @balance += money
  end

end

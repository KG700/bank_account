class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Array.new
  end

  def deposit(money)
    update_balance money
  end

  def withdraw(money)
    update_balance -money
  end

  private

  def update_balance money
    @balance += money
  end

end

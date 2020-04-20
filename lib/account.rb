class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Array.new
  end

  def deposit(money)
    update_balance money
    @transactions.push(Transaction.new(money, 'credit', Time.now))
  end

  def withdraw(money)
    update_balance -money
    @transactions.push(Transaction.new(money, 'debit', Time.now))
  end

  private

  def update_balance money
    @balance += money
  end

end

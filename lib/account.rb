class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Array.new
  end

  def deposit(money)
    update_balance money
    new_transaction money, 'credit'
  end

  def withdraw(money)
    update_balance -money
    new_transaction money, 'debit'
  end

  private

  def update_balance money
    @balance += money
  end

  def new_transaction money, type
    @transactions.push(Transaction.new(money, type, Time.now, @balance))
  end

end

require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transactions

  def initialize(transaction = Transaction, statement = Statement)
    @balance = 0
    @transactions = Array.new
    @transaction = transaction
    @statement = statement
  end

  def deposit(money)
    update_balance money
    new_transaction money, 'credit'
  end

  def withdraw(money)
    update_balance(-money)
    new_transaction money, 'debit'
  end

  def print_statement
    raise "You have no transactions. Statement cannot be generated" if @transactions.empty?

    @statement.new(@transactions).print
  end

  private

  def update_balance money
    @balance += money
  end

  def new_transaction money, type
    @transactions.push(@transaction.new(money, type, Time.now, @balance))
  end

end

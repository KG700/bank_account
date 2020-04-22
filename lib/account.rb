require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transactions

  def initialize(transaction = Transaction, statement = Statement)
    @transaction = transaction
    @statement = statement
    @transactions = Array.new
  end

  def deposit(money)
    new_transaction money, 'credit'
  end

  def withdraw(money)
    new_transaction money, 'debit'
  end

  def print_statement
    raise "You have no transactions. Statement cannot be generated" if @transactions.empty?

    @statement.new(@transactions).print
  end

  private

  def new_transaction money, type
    @transactions.push(@transaction.new(money, type, Time.now))
  end

end

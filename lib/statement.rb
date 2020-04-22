class Statement

  attr_reader :rows

  HEADER = "date || credit || debit || balance"

  def initialize(transactions)
    @rows = generate(transactions)
  end

  def generate(transactions)
    balance = 0
    transactions.map do |transaction|
      balance += update_balance(transaction)
      create_row(transaction, balance)
    end.reverse
  end

  def print
    puts HEADER
    @rows.each { |row| puts row }
  end

  private

  def update_balance(transaction)
    transaction.credit? ? transaction.amount : -transaction.amount
  end

  def create_row(transaction, balance)
    amount_column = transaction.credit? ? 1 : 2
    row = format(transaction.date), '', '', two_decimals(balance)
    row[amount_column] = two_decimals(transaction.amount)
    row.join(' || ').squeeze(' ')
  end
  
  def two_decimals(number)
    '%.2f' % number
  end

  def format(date)
    date.strftime("%m/%d/%Y")
  end

end

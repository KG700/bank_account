class Statement

  attr_reader :rows

  HEADER = "date || credit || debit || balance"

  def initialize(transactions)
    @rows = generate(transactions)
  end

  def generate(transactions)
    transactions.map! { |transaction| create_row(transaction) }.reverse
  end

  def print
    puts HEADER
    @rows.each { |row| puts row }
  end

  private

  def two_decimals(number)
    '%.2f' % number
  end

  def format(date)
    date.strftime("%m/%d/%Y")
  end

  def create_row(transaction)
    amount_column = transaction.credit? ? 1 : 2
    row = format(transaction.date), '', '', two_decimals(transaction.balance)
    row[amount_column] = two_decimals(transaction.amount)
    row.join(' || ').squeeze(' ')
  end

end

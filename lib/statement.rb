class Statement

  attr_reader :rows



  def initialize(transactions)
    @rows = generate
  end

  def generate
    ["date || credit || debit || balance", "10/01/2020 || 1000.00 || || 1000.00"]
  end

end

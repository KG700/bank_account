require 'statement'

describe Statement do

  let(:credit_transaction) { double :transaction, amount: 1000, type: 'credit', date: '10-01-2020', balance: 1000 }
  # let(:second_transaction) { double :transaction, amount: 500, type: 'debit', date: '12-01-2020', balance: 500 }

  let(:transactions) { [credit_transaction] }

  subject(:statement) { described_class.new transactions }

  describe '.generate' do

    it 'displays column headers in correct format' do
      expect(statement.rows[0]).to eq "date || credit || debit || balance"
    end

    it 'displays credit transaction in correct format' do
      expect(statement.rows[1]).to eq "10/01/2020 || 1000.00 || || 1000.00"
    end

  end

end

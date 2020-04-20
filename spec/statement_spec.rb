require 'statement'

describe Statement do

  let(:credit_transaction) { double :transaction, amount: 1000, type: 'credit', date: '10/01/2020', balance: 1000 }
  let(:debit_transaction) { double :transaction, amount: 300, type: 'debit', date: '12/01/2020', balance: 700 }
  let(:transactions) { [credit_transaction, debit_transaction] }
  subject(:statement) { described_class.new transactions }

  before(:each) do
    allow(credit_transaction).to receive(:credit?) { true }
    allow(debit_transaction).to receive(:credit?) { false }
  end

  describe '.generate' do


    # it 'displays column headers in correct format' do
    #   expect(statement.rows[0]).to eq "date || credit || debit || balance"
    # end

    it 'displays credit transaction in correct format' do
      expect(statement.rows[0]).to eq "10/01/2020 || 1000.00 || || 1000.00"
    end

    it 'displays debit transaction in correct format' do
      expect(statement.rows[1]).to eq "12/01/2020 || || 300.00 || 700.00"
    end

  end

  describe '.print' do

    it 'will output statement to console' do
      expect { statement.print }.to output(/date || credit || debit || balance/).to_stdout
    end

    it 'will output statement to console' do
      expect { statement.print }.to output(/10\/01\/2020 || 1000.00 || || 1000.00/).to_stdout
    end

    it 'will output statement to console' do
      expect { statement.print }.to output(/12\/01\/2020 || || 300.00 || 700.00/).to_stdout
    end

  end

end

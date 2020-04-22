require 'statement'

describe Statement do

  let(:yesterday) { Time.now - 86_400 }
  let(:today) { Time.now }

  let(:credit_transaction) { double :transaction, amount: 1000, type: 'credit', date: yesterday, balance: 1000 }
  let(:debit_transaction) { double :transaction, amount: 300, type: 'debit', date: today, balance: 700 }

  before(:each) do
    allow(credit_transaction).to receive(:credit?) { true }
    allow(debit_transaction).to receive(:credit?) { false }
  end

  describe '.generate' do

    context 'credit transaction' do
      let(:transactions) { [credit_transaction] }
      subject(:statement) { described_class.new transactions }

      it 'displays correct format' do
        expect(statement.rows[0]).to eq "#{yesterday.strftime("%m/%d/%Y")} || 1000.00 || || 1000.00"
      end
    end

    context 'debit transaction' do
      let(:transactions) { [debit_transaction] }
      subject(:statement) { described_class.new transactions }

      it 'displays in correct format' do
        expect(statement.rows[0]).to eq "#{today.strftime("%m/%d/%Y")} || || 300.00 || -300.00"
      end
    end

    context 'order of transactions' do
      let(:transactions) { [credit_transaction, debit_transaction] }
      subject(:statement) { described_class.new transactions }

      it 'are in reverse chronological order' do
        expect(statement.rows[0]).to eq "#{today.strftime("%m/%d/%Y")} || || 300.00 || 700.00"
        expect(statement.rows[1]).to eq "#{yesterday.strftime("%m/%d/%Y")} || 1000.00 || || 1000.00"
      end

    end

  end

  describe '.print' do
    let(:transactions) { [credit_transaction, debit_transaction] }
    subject(:statement) { described_class.new transactions }

    it 'will output statement to console' do
      expect { statement.print }.to output(/date \|\| credit \|\| debit \|\| balance/).to_stdout
    end

    it 'will output statement to console' do
      expect { statement.print }.to output(/ \|\| 1000.00 \|\| \|\| 1000.00/).to_stdout
    end

    it 'will output statement to console' do
      expect { statement.print }.to output(/ \|\| \|\| 300.00 \|\| 700.00/).to_stdout
    end

  end

end

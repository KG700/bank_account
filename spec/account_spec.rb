require 'account'

describe Account do

  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:statement) { double :statement }
  let(:statement_class) { double :statement_class, new: statement }
  subject(:account) { described_class.new(transaction_class, statement_class) }

  describe '.initializes' do
    it 'with an empty array of transactions' do
      expect(account.transactions).to eq []
    end
  end

  describe '.deposit' do
    it 'adds a transaction to the transactions array' do
      account.deposit(1000)
      expect(account.transactions.last).to be transaction
    end
  end

  describe '.withdraw' do

    before(:each) do
      account.instance_variable_set(:@balance, 3000)
    end

    it 'adds a transaction to the transactions array' do
      account.withdraw(1000)
      expect(account.transactions.last).to be transaction
    end
  end

  describe '.print_statement' do

    let(:today) { Time.now }
    let(:transaction) { double :transaction, amount: 1000, type: 'credit', date: today, balance: 1000 }

    it 'calls the print method in the statement class' do
      account.instance_variable_set(:@transactions, [transaction])

      expect(statement).to receive(:print)
      account.print_statement
    end

    it 'raises error when there are no transactions' do
      expect { account.print_statement }.to raise_error "You have no transactions. Statement cannot be generated"
    end

  end

end

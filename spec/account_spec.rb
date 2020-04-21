require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '.initializes' do
    it 'with a balance of zero' do
      expect(account.balance).to eq 0
    end
    it 'with an empty array of transactions' do
      expect(account.transactions).to eq []
    end
  end

  describe '.deposit' do
    it 'increases the balance 1000 when 1000 is deposited' do
      expect { account.deposit(1000) }.to change { account.balance }.by 1000
    end
    it 'increases the balance to 3000 when balance starts at 1000 and 2000 is deposited' do
      account.deposit(1000)
      expect { account.deposit(2000) }.to change { account.balance }.from(1000).to 3000
    end
    it 'adds a transaction to the transactions array' do
      account.deposit(1000)
      expect(account.transactions.last).to be_a Transaction
    end
  end

  describe '.withdraw' do

    before(:each) do
      account.instance_variable_set(:@balance, 3000)
    end

    it 'decreases the balance by 500 when 500 is withdrawn' do
      expect { account.withdraw(500) }.to change { account.balance }.from(3000).to 2500
    end
    it 'adds a transaction to the transactions array' do
      account.withdraw(1000)
      expect(account.transactions.last).to be_a Transaction
    end
  end

  describe '.print_statement' do

    let(:today) { Time.now }
    let(:transaction) { double :transaction, amount: 1000, type: 'credit', date: today, balance: 1000 }

    it 'calls the print method in the statement class' do
      account.instance_variable_set(:@transactions, [transaction])
      allow(transaction).to receive(:credit?) { true }

      expect_any_instance_of(Statement).to receive(:print)
      account.print_statement
    end

    it 'raises error when there are no transactions' do
      expect { account.print_statement }.to raise_error "You have no transactions. Statement cannot be generated"
    end

  end

end

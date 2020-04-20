require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '.initializes' do
    it 'with a balance of zero' do
      expect(account.balance).to eq 0
    end
  end

  describe '.deposit' do
    it 'increases the balance 1000 when 1000 is deposited' do
      expect { account.deposit(1000) }.to change{ account.balance }.by 1000
    end
    it 'increases the balance to 3000 when balance starts at 1000 and 2000 is deposited' do
      account.deposit(1000)
      expect { account.deposit(2000) }.to change{ account.balance }.from(1000).to 3000
    end
  end

  describe '.withdraw' do

    before(:each) do
      account.instance_variable_set(:@balance, 3000)
    end

    it 'decreases the balance by 500 when 500 is withdrawn' do
      expect { account.withdraw(500) }.to change{ account.balance }.from(3000).to 2500
    end
  end

end

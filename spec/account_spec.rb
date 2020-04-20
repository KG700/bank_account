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
      expect { account.deposit(1000, 10-01-2020) }.to change{ account.balance }.by 1000
    end
  end

end

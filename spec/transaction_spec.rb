require 'transaction'

describe Transaction do

  context 'credit transactions' do
    subject(:transaction) { described_class.new(100, 'credit', '10-01-2020') }

    it 'have amount of 100' do
      expect(transaction.amount).to eq 100
    end

  end

end

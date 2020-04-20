require 'transaction'

describe Transaction do

  context 'credit transactions' do
    subject(:transaction) { described_class.new(100, 'credit', '10-01-2020') }

    it 'have amount of 100' do
      expect(transaction.amount).to eq 100
    end

    it 'type is "credit"' do
      expect(transaction.type).to eq 'credit'
    end

    it 'date is "10-01-2020"' do
      expect(transaction.date).to eq '10-01-2020'
    end

    it '.credit? return true' do
      expect(transaction.credit?).to be true
    end

  end

end

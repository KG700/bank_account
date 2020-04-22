require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(1000, 'credit', '10-01-2020') }

  context 'credit transactions' do

    it 'have amount of 100' do
      expect(transaction.amount).to eq 1000
    end

    it 'type is "credit"' do
      expect(transaction.type).to eq 'credit'
    end

    it 'date is "10-01-2020"' do
      expect(transaction.date).to eq '10-01-2020'
    end

    # it 'balance is 1000' do
    #   expect(transaction.balance).to eq 1000
    # end

    it '.credit? returns true' do
      expect(transaction.credit?).to be true
    end

  end

  context 'debit transactions' do
    subject(:transaction) { described_class.new(500, 'debit', '10-01-2020') }

    it '.credit? returns false' do
      expect(transaction.credit?).to be false
    end

  end

end

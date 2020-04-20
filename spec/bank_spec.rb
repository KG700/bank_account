require 'bank'

describe Bank do

  subject(:bank) { described_class.new }

  describe '.initializes' do
    it 'with a balance of zero' do
      expect(bank.balance).to eq 0
    end

  end

end

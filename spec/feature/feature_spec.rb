describe 'User Stories' do

  let(:account) { Account.new }
  # let(:transaction) { Transaction.new }
  # let(:statement) { Statement.new }

  # As a user
  # So I can save my money
  # I would like to deposit money into my account
  it 'so I can save money, deposit money into my account' do
    expect { account.deposit(1000) }.not_to raise_error
  end

end

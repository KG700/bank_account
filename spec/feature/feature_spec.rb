describe 'User Stories' do

  let(:account) { Account.new }
  # let(:transaction) { Transaction.new }
  # let(:statement) { Statement.new }

  # As a user
  # So I can save my money
  # I would like to deposit money into my account
  it 'so money can be saved, deposit money into account' do
    expect { account.deposit(1000) }.not_to raise_error
  end

  # As a user
  # So I can use the money I've saved
  # I would like be able to withdraw money in my account
  it 'so money can be used, withdraw money from account' do
    expect { account.withdraw(200) }.not_to raise_error
  end

end

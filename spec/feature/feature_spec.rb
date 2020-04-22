describe 'User Stories' do

  let(:account) { Account.new }

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

  # As a user
  # So I can see my account balance and transactions
  # I would like be able to print a statement of my account
  it 'when transactions have been made, display statement in correct format' do
    account.deposit(1000)
    account.withdraw(300)
    expect { account.print_statement }.to output(/date \|\| credit \|\| debit \|\| balance/).to_stdout
    # expect { account.print_statement }.to output(/ \|\| \|\| 300.00 \|\| 700.00/).to_stdout
    # expect { account.print_statement }.to output(/ \|\| 1000.00 \|\| \|\| 1000.00/).to_stdout
  end

  # As a user
  # So I can understand why a statement doesn't print when I haven't made transactions
  # I would like be able to see a useful error messge when I try and print a statement for an account with no transactions
  it 'when no transactions have been made, display a useful error message' do
    expect { account.print_statement }.to raise_error "You have no transactions. Statement cannot be generated"
  end

end

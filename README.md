Bank Application
---

**Specifications**
This is an application that simulates a bank. It allows you to start a new account. Deposit money into your account, and withdraw
money from your account. You can also print an account statement.

Steps for using application:

1. Open up IRB in your terminal
```
irb
```

2. Create a new account
```
account = Account.new
```
3. Deposit some money
```
account.deposit(3000)
```
4. Withdraw some money
```
account.withdraw(500)
```
5. Print an account Statement
```
account.print_statement
```

Account statement will print in your console in this format:
```
date || credit || debit || balance
20/04/2020 || 2000.00 || || 3000.00
20/04/2020 || || 500.00 || 2500.00
```

To run my tests, just type rspec into your terminal
```
rspec
```

**Application Design**
Describe here how I approached designing my solution and I structured my code. Why did I do it this way?

![Bank Diagram](/images/bank_diagram.png)

**Testing** :
Input Output tables

<ins>Account:</ins>
- [x] @balance initializes at 0
- [x] .deposit(1000) --> @balance == 1000
- [x] .deposit(2000) --> @balance == 3000
- [x] .withdraw(500) --> @balance == 2500
- [x] @transactions initializes as empty array
- [x] .deposit(100) --> adds a transaction to transactions array
- [x] .withdraw(100) --> adds a transaction to transactions array
- [ ] .print_statement prints statement in correct format

<ins>Transaction:</ins>
- [x] when .initialize amount with 100 --> transaction.amount == 100
- [x] .initialise type with 'credit' --> transaction.type == 'credit'
- [x] .initialize date with '10-01-2020' --> transaction.date == '10-01-2020'
- [x] when transaction.type == 'credit' --> .credit? == true
- [x] when transaction.type == 'debit' --> .credit? == false
- [x] .initalize balance with 1000 --> transaction.balance == 1000

<ins>Statement</ins>
- [x] .print out column headers --> date || credit || debit || balance
- [x] .print out credit transaction in format --> "10/01/2020 || 1000.00 || || 1000.00"
- [x] .print out debit transaction in format --> "14/01/2012 || || 500.00 || 2500.00"
- [ ] change '10-01-2020' --> '10/01/2020'


**Dependencies**
List here the dependencies I've used and justify why I used them. What trade-offs did I make when deciding what dependencies to use?

**Future Improvements**
List here future developments I would make to this application with more time.

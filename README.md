Bank Application
---

Include screenshots of me running my application

**Specifications**
* Deposit money
* Withdraw money
* Print account statement that displays in command line like this:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
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
- [ ] .withdraw(100) --> adds a transaction to transactions array

<ins>Transaction:</ins>
- [x] .initialize amount with 100 --> transaction.amount == 100
- [x] .initialise type with 'credit' --> transaction.type == 'credit'
- [x] .initialize date with '10-01-2020' --> transaction.date == '10-01-2020'
- [x] when transaction.type == 'credit' --> .credit? == true
- [x] when transaction.type == 'debit' --> .credit? == false

**Installation**
Describe here how to install and run my code and tests

**Dependencies**
List here the dependencies I've used and justify why I used them. What trade-offs did I make when deciding what dependencies to use?

**Future Improvements**
List here future developments I would make to this application with more time.

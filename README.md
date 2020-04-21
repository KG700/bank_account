Bank Application
---

### Specifications
This application simulates banking behaviour. It allows you to start a new account, deposit money into your account, and withdraw money from your account. You can also print an account statement to view all of your transactions in a table.

##### Quick Start: Set up and start using this application:
1. Fork and clone this repository and install dependencies
```
bundle
```
2. Open up IRB in your terminal
```
irb -r ./lib/account.rb
```

3. Create a new account
```
account = Account.new
```
4. Deposit some money
```
account.deposit(3000)
```
5. Withdraw some money
```
account.withdraw(500)
```
6. Print an account Statement
```
account.print_statement
```

Account statement will print in your console in this format:
```
date || credit || debit || balance
20/04/2020 || || 500.00 || 2500.00
20/04/2020 || 2000.00 || || 3000.00
```

To run the unit tests, just type into your terminal:
```
rspec
```

### Application Design
I designed this application to have 3 classes, each with a single responsibility:
- **Account** is the main class that the user interacts with. It is responsible for creating and storing transactions and calculating the account balance.
- **Transaction** is responsible for storing the key information about each transaction. It stores the date of the transaction, the amount, whether the transaction is a credit or debit and the balance at the point of the transaction.
- **Statement** is responsible for generating and displaying all the transaction details in a format for the user to digest.

![Bank diagram](/images/bank_diagram.png?)

### Testing
The application was developed using TDD, resulting in an application with 100% test coverage according to SimpleCov. The Input Output table below was used to plan out each step of the TDD process.

| Done              | Class       | Input                                   | Output                |
| :---:             | ---         | ---                                     | :---:                 |
| :white_check_mark:| Account     | .initializes @balance                   | 0                     |
| :white_check_mark:| Account     |  .deposit(1000)                         | @balance == 1000      |
| :white_check_mark:| Account     |  @balance == 1000 : .deposit(2000)      | @balance == 3000      |
| :white_check_mark:| Account     |  @balance == 3000 : .withdraw(500)      | @balance == 2500      |
| :white_check_mark:| Account     |  .initializes @transactions             | []                    |
| :white_check_mark:| Account     |  .deposit(100)                          |[Transaction.new]      |
| :white_check_mark:| Account     |  .withdraw(100)                         |[Transaction.new]      |
| :white_check_mark:| Account     |  .withdraw(100)                         |[Transaction.new]      |
| :white_check_mark:| Account     |  .print_statement with transactions     |prints correctly       |
| :white_check_mark:| Account     |  .print_statement without transactions  |raises error           |
| :white_check_mark:| Transaction | when @type == 'credit'                  | .credit? == true      |
| :white_check_mark:| Transaction | when @type == 'debit'                   | .credit? == false     |
| :white_check_mark:| Statement   | .print prints column headers            | headers printed       |
| :white_check_mark:| Statement   | .print prints credit transaction        | credit in 2nd column  |
| :white_check_mark:| Statement   | .print prints debit transaction         | debit in 3rd column   |
| :white_check_mark:| Statement   | .print date in correct format           | DD/MM/YYY             |
| :white_check_mark:| Statement   | prints in correct order                 | reverse chronological |

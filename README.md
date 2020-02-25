# MAKERS ACADEMY - WEEK 10 - TECH TEST: "Bank"
![Ruby](https://github.com/Marcellofabbri/Bank-Tech-Test/workflows/Ruby/badge.svg)
[Link to the original repository](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

The test could be taken either in Ruby or JavaScript. This one is in __ruby__ (version 2.6.3).

### Gems
Upon download, run `bundle install` to install all necessary testing gems (Rspec and SimpleCov and Rubocop). No other additional gems have been used apart from Rake, also going to be installed when running `bundle install`.

### Running tests
To use __Rspec__ from the command line run `rspec`.
__Rubocop__ is integrated with Rspec and will run whenever Rspec is called, and is an acceptance criterion for passing tests.
To call Rubocop indipendently run `rubocop` from the command line.
Running `rake` from the top level of the directory will also run Rspec.

### Coverage
[![Coverage](https://Marcellofabbri.github.io/Bank-Tech-Test/badge.svg)](https://github.com/Marcellofabbri/Bank-Tech-Test)
__SimpleCov__ is integrated with Rspec and will run whenever Rspec is called.

### The Program
It should be able to be interacted with through a REPL such as Pry, IRB (Ruby) or a browser console (JavaScript).
It has four classes: Account, Record, Datestamper, Printer.

Example on how to meet the final requirement of the test:
- in the terminal, from the top level of the project's directory, run `irb` and run the following commands:
```
require './lib/printer.rb'
printer = Printer.new(Account.new)
account = printer.account
account.deposit(2000)
account.deposit(1000)
account.withdraw(500)
printer.print_statement
```
- the result should be:
```
date || credit || debit || balance
24/02/2020 ||  || 500.0 || 2500.0
24/02/2020 || 2000.0 ||  || 2000.0
24/02/2020 || 1000.0 ||  || 3000.0
```
The date is supposed to be relevant to the real date on which the commands are run.
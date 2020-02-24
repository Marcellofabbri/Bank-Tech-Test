require_relative 'record'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'amount must be a positive number' if amount.negative?

    @balance += amount
    @transactions << Record.new.log(amount)
  end

  def withdraw(amount)
    raise 'amount must be a positive number' if amount.negative?

    raise 'cannot withdraw more than the present funds' if balance < amount

    @balance -= amount
    @transactions << Record.new.log(-amount)
  end

  def record_creation(amount)
    record = Record.new
    record.log(amount)
    record
  end
end

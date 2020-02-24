require_relative 'record'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'amount must be a positive number' if amount.negative?

    @balance += amount.to_f
    @transactions << record_creation(amount)
    @transactions = @transactions.reverse
  end

  def withdraw(amount)
    raise 'amount must be a positive number' if amount.negative?

    raise 'cannot withdraw more than the present funds' if balance < amount

    @balance -= amount.to_f
    @transactions << record_creation(-amount)
  end

  def record_creation(amount)
    record = Record.new(@balance)
    record.log(amount)
    record
  end
end

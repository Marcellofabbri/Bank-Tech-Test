class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise 'amount must be a positive number' if amount.negative?

    @balance += amount
  end

  def withdraw(amount)
    raise 'amount must be a positive number' if amount.negative?
    
    @balance -= amount
  end
end

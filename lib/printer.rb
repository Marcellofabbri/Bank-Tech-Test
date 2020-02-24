require_relative 'account'

class Printer
  attr_reader :account
  def initialize(account = Account.new)
    @account = account
  end

  def statement_header
    'date || credit || debit || balance'
  end
end

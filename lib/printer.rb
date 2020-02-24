class Printer
  attr_reader :account
  def initialize(account = Account.new)
    @account = account
  end
end

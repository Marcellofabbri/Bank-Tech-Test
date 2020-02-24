require 'account'
require 'printer'

describe Printer do
  describe '#initialize' do
    it 'is initialized with an Account class injected' do
      account = Account.new
      printer = Printer.new(account)
      expect(printer.account).to be_kind_of(Account)
    end
  end
end

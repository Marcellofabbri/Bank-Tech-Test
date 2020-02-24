require 'account'
require 'printer'
require 'datestamper'

describe Printer do
  describe '#initialize' do
    it 'is initialized with an Account class injected' do
      account = Account.new
      printer = Printer.new(account)
      expect(printer.account).to be_kind_of(Account)
    end
  end

  describe '#statement_header' do
    it 'returns the first line of a statement' do
      expect(subject.statement_header).to eq 'date || credit || debit || balance'
    end
  end
end

require 'account'
require 'printer'
require 'datestamper'

describe Printer do
  let(:time) { Time.new.strftime('%d/%m/%Y') }

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

#   describe '#print_statement' do
#     let(:account) { Account.new }

#     it 'prints in a REPL the current statement of the account'
#       account.deposit(2000)
#       account.withdraw(100)
#       expect { subject.print_statement }.to output("date || credit || debit || balance
#       #{time} || || 100.00 || 2900.00
#       #{time} || 2000.00 || || 2000.00").to_stdout
#     end
#   end
end

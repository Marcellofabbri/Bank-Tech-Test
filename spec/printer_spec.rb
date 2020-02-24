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

  describe '#print_statement' do
    it 'prints in a REPL the current statement of the account' do
      printer = Printer.new(Account.new)
      printer.account.deposit(2000)
      printer.account.withdraw(100)
      printer.account.transactions[0].date = '24/02/2020'
      printer.account.transactions[1].date = '25/02/2020'
      expect(printer.statement_header).to eq('date || credit || debit || balance')
      expect(printer.records_retriever).to eq('25/02/2020 ||  || 100.0 || 1900.0
24/02/2020 || 2000.0 ||  || 2000.0')
      expect { printer.print_statement }.to output("date || credit || debit || balance\n25/02/2020 ||  || 100.0 || 1900.0\n24/02/2020 || 2000.0 ||  || 2000.0\n").to_stdout
    end
  end
end

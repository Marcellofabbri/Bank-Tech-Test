require 'account'
require 'printer'
require 'datestamper'

describe Printer do
  describe '#print_statement' do
    it 'prints in a REPL the current statement of the account' do
      record1 = double('record', date: '24/02/2020', debit: 0, credit: 2000.0, current_balance: 2000.0)
      allow(record1).to receive(:debit).and_return('')
      record2 = double('record', date: '25/02/2020', debit: 100.0, credit: 0, current_balance: 1900.0)
      allow(record2).to receive(:credit).and_return('')
      account = double('account', balance: 1900.0, transactions: [record1, record2])
      printer = Printer.new(account)
      expect { printer.print_statement }.to output("date || credit || debit || balance\n25/02/2020 ||  || 100.0 || 1900.0\n24/02/2020 || 2000.0 ||  || 2000.0\n").to_stdout
    end
  end
end

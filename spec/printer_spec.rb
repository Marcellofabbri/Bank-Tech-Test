require 'account'
require 'printer'
require 'datestamper'

describe Printer do
  # let(:time) { Time.new.strftime('%d/%m/%Y') }

  describe '#print_statement' do
    it 'prints in a REPL the current statement of the account' do
      record1 = double('record', date: '24/02/2020', debit: 0, credit: 2000, current_balance: 2000)
      rendered_record1 = double('rendered_record1', date: '24/02/2020', debit: '', credit: 2000, current_balance: 2000)
      allow(record1).to receive(:render).and_return(rendered_record1)
      allow(record1).to receive(:stringify).and_return('24/02/2020 || 2000.0 ||  || 2000.0')
      record2 = double('record', date: '25/02/2020', debit: 100, credit: 0, current_balance: 1900)
      rendered_record2 = double('rendered_record2', date: '25/02/2020', debit: 100, credit: '', current_balance: 1900)
      allow(record2).to receive(:stringify).and_return('25/02/2020 ||  || 100.0 || 1900.0')
      allow(record2).to receive(:render).and_return(rendered_record2)
      account = double('account', balance: 1900, transactions: [record1, record2])
      printer = Printer.new(account)
      # printer.account.deposit(2000)
      # printer.account.withdraw(100)
      # printer.account.transactions[0].date = '24/02/2020'
      # printer.account.transactions[1].date = '25/02/2020'
      expect { printer.print_statement }.to output("date || credit || debit || balance\n25/02/2020 ||  || 100.0 || 1900.0\n24/02/2020 || 2000.0 ||  || 2000.0\n").to_stdout
    end
  end
end

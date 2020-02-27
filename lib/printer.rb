require_relative 'account'
require_relative 'record'

class Printer
  attr_reader :account
  def initialize(account = Account.new)
    @account = account
    @statement_header = 'date || credit || debit || balance'
  end

  def print_statement
    puts @statement_header
    puts records_retriever
  end

  def records_retriever
    array = []
    account.transactions.reverse.each do |record|
      record.debit = '' if record.debit == 0
      record.credit = '' if record.credit == 0
      stringified_record = record.date.to_s + ' || ' + record.credit.to_s + ' || ' + record.debit.to_s + ' || ' + record.current_balance.to_s
      array.push(stringified_record)
    end
    array.join("\n")
  end
end

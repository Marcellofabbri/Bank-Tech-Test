require_relative 'account'
require_relative 'record'

class Printer
  attr_reader :account
  def initialize(account = Account.new)
    @account = account
  end

  def print_statement
    puts statement_header
    puts records_retriever
  end

  def statement_header
    'date || credit || debit || balance'
  end

  def records_retriever
    account.transactions.each { |record| record.render }
    array = []
    account.transactions.reverse.each { |record| array.push(record.stringify) }
    array.join("\n")
  end
end

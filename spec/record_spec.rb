require 'datestamper'
require 'record'

describe Record do
  let(:time) { Time.new.strftime('%d/%m/%Y') }
  let(:record) { Record.new(50) }

  describe '#initialize' do
    it 'is initialized with fields: date, debit, credit, current_balance' do
      expect(record.date).to eq time # e.g. 24/02/2020
      expect(record.debit).to eq 0.00 # withdrew €0
      expect(record.credit).to eq 0.00 # deposited €0
      expect(record.current_balance).to eq 50.00 # current (initial) balance is €0
    end
  end

  describe '#log' do
    it 'stores amount of transaction into a credit field if positive number' do
      record.log(50)
      expect(record.debit).to eq 0.00
      expect(record.credit).to eq 50.00
    end

    it 'stores amount of transaction into a credit field if negative number' do
      record.log(-30)
      expect(record.debit).to eq 30.00
      expect(record.credit).to eq 0.00
    end
  end
end

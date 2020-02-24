require 'datestamper'
require 'record'

describe Record do
  let(:time) { Time.new.strftime('%d/%m/%Y') }

  describe '#initialize' do
    it 'is initialized with fields: date, debit, credit' do
      expect(subject.date).to eq time # e.g. 24/02/2020
      expect(subject.debit).to eq 0 # withdrew €0
      expect(subject.credit).to eq 0 # deposited €0
    end
  end

  describe '#log' do
    let(:record) { Record.new }

    it 'stores amount of transaction into a credit field if positive number' do
      record.log(50)
      expect(record.debit).to eq 0
      expect(record.credit).to eq 50
    end

    it 'stores amount of transaction into a credit field if negative number' do
      record.log(-30)
      expect(record.debit).to eq 30
      expect(record.credit).to eq 0
    end
  end
end

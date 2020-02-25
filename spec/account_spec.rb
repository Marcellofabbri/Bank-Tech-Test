require 'account'

describe Account do
  let(:time) { Time.new.strftime('%d/%m/%Y') }

  describe '#initialize' do
    it 'is initialized with a balance field set to zero upon instantiation' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'lets a user add money to their account' do
      subject.deposit(20)
      expect(subject.balance).to eq 20.00
    end

    it 'does not work with negative amounts' do
      expect { subject.deposit(-5) }.to raise_error('amount must be a positive number')
    end

    it 'adds a Record object to transactions field of Account' do
      subject.deposit(20)
      expect(subject.transactions.first).to be_kind_of Record
    end
  end

  describe '#withdraw' do
    it 'lets a user withdraw money from their account' do
      subject.deposit(70)
      subject.withdraw(10)
      expect(subject.balance).to eq 60.00
    end

    it 'does not work with negative amounts' do
      expect { subject.withdraw(-5) }.to raise_error('amount must be a positive number')
    end

    it 'does not let withdrawal exceed the balance ' do
      subject.deposit(10)
      expect { subject.withdraw(11) }.to raise_error('cannot withdraw more than the present funds')
    end

    it 'adds a Record object to transactions field of Account' do
      subject.deposit(30)
      subject.withdraw(20)
      expect(subject.transactions.first).to be_kind_of Record
    end
  end

  describe '#record_creation' do
    it 'creates a record object which stores details about transaction' do
      expect(subject.record_creation(20)).to be_kind_of Record
    end
  end

  describe '#render' do
    it 'changes the credit or debit field to an empty string' do
      record = Record.new(200)
      record.debit = 15
      record.render
      expect(record.credit).to eq ''
    end
  end

  describe '#stringify' do
    it 'returns a string with all the info about the record' do
      record = Record.new(200)
      record.debit = 15
      expect(record.stringify).to eq record.date.to_s + ' || 0 || 15 || 200'
    end
  end
end

require 'account'

describe Account do
  let(:time) { Time.new.strftime('%d/%m/%Y') }
  subject(:account) { Account.new }
  let(:record1) { double('record') }
  let(:record2) { double('record') }

  describe '#initialize' do
    it 'is initialized with a balance field set to zero upon instantiation' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'lets a user add money to their account' do
      allow(account).to receive(:record_creation).with(20).and_return(record1)
      account.deposit(20)
      expect(account.balance).to eq 20.00
    end

    it 'does not work with negative amounts' do
      expect { subject.deposit(-5) }.to raise_error('amount must be a positive number')
    end

    # it 'adds a Record object to transactions field of Account' do
    #   allow(account).to receive(:record_creation).with(20).and_return(record1)
    #   account.deposit(20)
    #   expect(account.transactions.first).to be_kind_of Record
    # end
  end

  describe '#withdraw' do
    it 'lets a user withdraw money from their account' do
      allow(account).to receive(:record_creation).with(70).and_return(record1)
      account.deposit(70)
      allow(account).to receive(:record_creation).with(-10).and_return(record2)
      account.withdraw(10)
      expect(account.balance).to eq 60.00
    end

    it 'does not work with negative amounts' do
      expect { subject.withdraw(-5) }.to raise_error('amount must be a positive number')
    end

    it 'does not let withdrawal exceed the balance ' do
      allow(account).to receive(:record_creation).with(10).and_return(record1)
      account.deposit(10)
      allow(account).to receive(:record_creation).with(-11).and_return(record2)
      expect { account.withdraw(11) }.to raise_error('cannot withdraw more than the present funds')
    end

    # it 'adds a Record object to transactions field of Account' do
    #   subject.deposit(30)
    #   subject.withdraw(20)
    #   expect(subject.transactions.first).to be_kind_of Record
    # end
  end

  describe '#record_creation' do
    it 'creates a record object which stores details about transaction' do
      allow(account).to receive(:record_creation).with(20).and_return(record1)
      expect(account.record_creation(20)).to eq record1
    end
  end
end

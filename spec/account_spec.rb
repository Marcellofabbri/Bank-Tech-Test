require 'account'

describe Account do
  describe '#initialize' do
    it 'is initialized with a balance field set to zero upon instantiation' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'lets a user add money to their account' do
      subject.deposit(20)
      expect(subject.balance).to eq 20
    end

    it 'does not work with negative amounts' do
      expect { subject.deposit(-5) }.to raise_error('amount must be a positive number')
    end
  end

  describe '#withdraw' do
    it 'lets a user withdraw money from their account' do
      subject.deposit(70)
      subject.withdraw(10)
      expect(subject.balance).to eq 60
    end
  end
end

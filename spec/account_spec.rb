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
  end
end


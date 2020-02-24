require 'account'

describe Account do
  describe '#initialize' do
    it 'is initialized with a balance field set to zero upon instantiation' do
      expect(subject.balance).to eq 0
    end
  end
end

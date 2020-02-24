require 'datestamper'

describe Datestamper do
  let(:time) { Time.new.strftime('%d/%m/%Y') }

  describe '#datestamp' do
    it 'spews out a formatted date' do
      expect(subject.datestamp).to eq time
    end
  end
end

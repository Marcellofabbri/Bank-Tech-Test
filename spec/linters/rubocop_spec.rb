require_relative '../spec_helper'

RSpec.describe 'rubocop analysis' do
  subject(:report) { `rubocop` }

  it 'has no offenses' do
    expect(report).to match('/no\ offenses\ detected/')
    p report
  end
end

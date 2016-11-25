require 'spec_helper'

RSpec.describe TvYandexParser::WebClient do
  describe '#fetch' do
    it 'successfully' do
      expect(subject.fetch(Time.now)).to be_success
    end
    
    it 'raise argument error if passed not Time as date argument' do
      expect {
        subject.fetch('not a time')
      }.to raise_error(ArgumentError, 'Pass a Time object')
    end
  end
end

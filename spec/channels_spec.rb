require 'spec_helper'

RSpec.describe TvScheduleParser::CHANNELS do
  it 'has hunt and fishing channel' do
    expect(described_class::HUNT_AND_FISHING).to eq 617
  end
end

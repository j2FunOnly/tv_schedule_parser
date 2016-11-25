require 'spec_helper'

RSpec.describe TvYandexParser::Schedule do
  let(:webclient) { TvYandexParser::WebClient.new }
  subject { described_class.new(webclient.fetch(Time.now)) }

  it 'has a title' do
    expect(subject.title).to_not be_nil
  end

  it 'has a several schedule items' do
    expect(subject.items.size).to be > 0
  end

  it 'is available for today' do
    expect(subject).to be_available
  end

  it 'not available in next two week' do
    page = webclient.fetch(Time.now + 60 * 60 * 24 * 7 * 2)
    expect(described_class.new(page)).to_not be_available
  end
end

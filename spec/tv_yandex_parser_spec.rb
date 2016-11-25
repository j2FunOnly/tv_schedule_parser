require "spec_helper"

RSpec.describe TvYandexParser do
  it 'saves tv schedule in pdf file' do
    parser = TvYandexParser::Parser.new(Time.now, 7, TvYandexParser::CHANNELS::HUNT_AND_FISHING)
    parser.to_pdf("tmp/#{Time.now.strftime '%d-%m-%Y'}-test.pdf")
  end
end

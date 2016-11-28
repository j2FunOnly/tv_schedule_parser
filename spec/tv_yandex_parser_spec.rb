require "spec_helper"

RSpec.describe TvYandexParser do
  it 'saves tv schedule in pdf file' do
    filename = "tmp/#{Time.now.strftime '%d-%m-%Y'}-test.pdf"
    parser = TvYandexParser::Parser.new(Time.now, 1, TvYandexParser::CHANNELS::HUNT_AND_FISHING)
    parser.to_pdf(filename)
    expect(File.exist? filename).to be_truthy
  end
end

require "spec_helper"

RSpec.describe TvScheduleParser do
  it 'saves tv schedule in pdf file' do
    filename = "tmp/#{Time.now.strftime '%d-%m-%Y'}-test.pdf"
    parser = TvScheduleParser::Parser.new(Time.now, 1, TvScheduleParser::CHANNELS::HUNT_AND_FISHING)
    parser.to_pdf(filename)
    expect(File.exist? filename).to be_truthy
  end
end

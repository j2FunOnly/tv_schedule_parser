require 'tv_schedule_parser/version'
require 'tv_schedule_parser/channels'
require 'tv_schedule_parser/schedule'
require 'tv_schedule_parser/web_client'
require 'tv_schedule_parser/pdf_reporter'

module TvScheduleParser
  class Parser
    def initialize(date = Time.now, days = 1, channel = nil)
      @webclient = WebClient.new do |c|
        c.channel = channel if channel
      end

      get_schedule date, days
    end

    def to_pdf(filename)
      TvScheduleParser::PDFReporter.new(@schedule).to_file(filename)
    end

    def get_schedule(start_date, days)
      @schedule = (0...days).map do |day|
        date = start_date + day * 60 * 60 * 24
        Schedule.new(date.strftime('%d-%m-%Y'), @webclient.fetch(date))
      end
    end

  end
end

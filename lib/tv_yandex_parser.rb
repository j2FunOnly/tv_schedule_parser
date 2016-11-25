require 'tv_yandex_parser/version'
require 'tv_yandex_parser/channels'
require 'tv_yandex_parser/schedule'
require 'tv_yandex_parser/web_client'
require 'tv_yandex_parser/pdf_reporter'

module TvYandexParser
  class Parser
    def initialize(date, days, channel)
      @webclient = WebClient.new do |c|
        c.channel = channel
      end

      @schedule = get_schedule date, days
    end

    def to_pdf(filename)
      TvYandexParser::PDFReporter.new(@schedule).to_file(filename)
    end

    def get_schedule(start_date = Time.now, days = 1)
      (0...days).map do |day|
        date = start_date + day * 60 * 60 * 24
        Schedule.new(date.strftime('%d-%m-%Y'), @webclient.fetch(date))
      end
    end

  end
end

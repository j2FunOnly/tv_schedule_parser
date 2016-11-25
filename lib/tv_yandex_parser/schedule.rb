require 'nokogiri'

module TvYandexParser
  class Schedule
    def initialize(page)
      @doc = Nokogiri::HTML(page)
    end

    def title
      @title ||= @doc.title
    end

    def items
      @items ||= @doc.css('.b-tv-channel-schedule__item')
    end

    def tv_splash
      @tv_splash ||= @doc.css('.tv-splash')
    end

    def available?
      items.size > 0
    end

    def to_pdf
      PDFReporter.new(self)
    end
  end
end

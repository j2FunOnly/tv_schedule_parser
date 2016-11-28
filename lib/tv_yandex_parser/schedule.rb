require 'nokogiri'

module TvYandexParser
  class Schedule
    def initialize(title, page)
      @title = title
      @doc = Nokogiri::HTML(page)
    end

    def title
      @title
    end

    def items
      @items ||= @doc.css('.b-tv-channel-schedule__item').map do |item|
        {
          time: item.css('.tv-event__time-text').text,
          description: item.css('.tv-event__title-inner').text
        }
      end
    end

    def tv_splash
      @tv_splash ||= @doc.css('.tv-splash').text
    end

    def available?
      items.size > 0
    end

  end
end

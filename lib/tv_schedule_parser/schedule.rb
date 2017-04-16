require 'nokogiri'

module TvScheduleParser
  class Schedule
    def initialize(title, page)
      @title = title
      @doc = Nokogiri::HTML(page)
    end

    def title
      @title
    end

    def items
      @items ||= @doc.css('.channel-schedule__event').map do |item|
        {
          time: item.css('.channel-schedule__time').text,
          description: item.css('.channel-schedule__text').text
        }
      end
    end

    def tv_splash
      @tv_splash ||= @doc.css('.channel-schedule_empty-splash').text
    end

    def available?
      items.size > 0
    end

    def inspect
      "Schedule for #{title}"
    end

  end
end

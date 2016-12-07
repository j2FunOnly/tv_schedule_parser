require 'httparty'

module TvScheduleParser
  class WebClient
    include HTTParty
    follow_redirects false

    def initialize
      yield config if block_given?
      set_base_uri
    end

    def set_base_uri
      response = self.class.get('https://tv.yandex.ru')
      self.class.base_uri "https://tv.yandex.ru#{response.headers['location']}"
    end

    def fetch(date)
      raise ArgumentError, 'Pass a Time object' unless date.is_a? Time

      date = date.strftime '%Y-%m-%d'
      uri = '/channels/%s?date=%s&period=all-day' % [config.channel, date]
      response = self.class.get(uri)
      if response.success?
        response
      else
        raise response.response
      end
    end

    def config
      @config ||= Configuration.new
    end

    class Configuration
      attr_writer :channel

      def channel
        @channel ||= 617
      end
    end
  end
end

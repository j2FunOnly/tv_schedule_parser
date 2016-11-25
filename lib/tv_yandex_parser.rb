require 'tv_yandex_parser/version'
require 'tv_yandex_parser/channels'
require 'tv_yandex_parser/schedule'
require 'tv_yandex_parser/web_client'

module TvYandexParser
  class Parser
    def initialize(channel)
      @webclient = WebClient.new do |c|
        c.channel = channel
      end
    end

    def schedule(start_date = Time.now, days = 1)
      (0...days).map do |day|
        Schedule.new(@webclient.fetch(start_date + i * 60 * 60 * 24))
      end
    end
  end
end

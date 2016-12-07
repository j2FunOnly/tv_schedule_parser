require 'prawn'

module TvScheduleParser
  class PDFReporter
    include Prawn::View

    def initialize(schedule)
      @schedule = schedule
      setup_font
      render_schedule
    end

    def to_file(filename)
      filename += '.pdf' unless filename.end_with? '.pdf'
      save_as filename
    end

    private

    def setup_font
      font_families.update(
        'PT Sans' => {
          normal: File.expand_path('../../fonts/pt_sans.ttf', __FILE__),
          bold: File.expand_path('../../fonts/pt_sans_bold.ttf', __FILE__)
        }
      )
      font 'PT Sans'
      font_size 14
    end

    def render_schedule
      @schedule.each_with_index do |day, i|
        start_new_page if i > 0
        render_title day.title
        render_day day
      end
    end

    def render_title(title)
      text "<font size='16'><b>#{title}</b></font>", inline_format: true
      stroke_horizontal_rule
      move_down 10
    end

    def render_day(day)
      if day.available?
        day.items.each do |item|
          text "#{item[:time]} #{item[:description]}"
        end
      else
        text day.tv_splash
      end
    end
  end
end

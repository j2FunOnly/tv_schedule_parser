require 'prawn'

module TvYandexParser
  class PDFReporter
    include Prawn::View

    def initialize(schedule)
      font_families.update(
        'PT Sans' => {
          normal: File.expand_path('../../fonts/pt_sans.ttf', __FILE__),
          bold: File.expand_path('../../fonts/pt_sans_bold.ttf', __FILE__)
        }
      )
      font 'PT Sans'
      font_size 14

      schedule.each_with_index do |day, i|
        start_new_page if i > 0
        text "<font size='16'><b>#{day.title}</b></font>", inline_format: true
        stroke_horizontal_rule
        move_down 10
        if day.available?
          day.items.each do |item|
            text "#{item[:time]} #{item[:description]}"
          end
        else
          text day.tv_splash
        end
      end
    end

    def to_file(filename)
      filename += '.pdf' unless filename.end_with? '.pdf'
      save_as filename
    end
  end
end

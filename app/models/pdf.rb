class Pdf < Prawn::Document
  def initialize user
    super top_margin: 10, page_layout: :portrait, page_size: 'A4'

    @max_width = 525
    @max_height = 800

    content user
  end

  def content user
    move_down 15
    text "User: #{user.display_name}"

    move_down 5
    string =  'Since: '
    string += "#{DateTime.now.advance(days: -7).beginning_of_day.strftime('%m/%d/%Y')}"
    text string

    move_down 5
    text "7 Day Total: #{total_duration user.time_logs.seven_days}"

    data = [['ID', 'Clock In', 'Clock Out', 'Duration']]

    cursor = @max_height - 100
    move_cursor_to cursor
    draw_text 'ID', at: [0, cursor]
    draw_text 'Clock In', at: [@max_width * 0.15, cursor]
    draw_text 'Clock Out', at: [@max_width * 0.5, cursor]
    draw_text 'Duration', at: [@max_width * 0.85, cursor]

    user.time_logs.seven_days.each do |log|
      cursor -= 20
      draw_text log.id, at: [0, cursor]
      draw_text log.display_clock_in, at: [@max_width * 0.15, cursor]
      draw_text log.display_clock_out, at: [@max_width * 0.5, cursor]
      draw_text log.display_duration, at: [@max_width * 0.85, cursor]
    end
  end

  private

    def total_duration arr
      reduced = arr.map(&:duration).reduce(:+)
      Time.at(reduced.to_i).utc.strftime('%H:%M:%S')
    end
end
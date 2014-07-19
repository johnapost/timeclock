module ApplicationHelper
  def page_title
    @current_page_title ? "TimeClock | #{@current_page_title}" : 'TimeClock'
  end

  def total_duration arr
    reduced = arr.map(&:duration).reduce(:+)
    Time.at(reduced.to_i).utc.strftime('%H:%M:%S')
  end
end

module ApplicationHelper
  def page_title
    @current_page_title ? "TimeClock | #{@current_page_title}" : 'TimeClock'
  end
end

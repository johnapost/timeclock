module DashboardHelper
  def display_datetime date
    date.localtime.strftime('%m/%d/%Y - %l:%M %p')
  end

  def display_duration duration
    Time.at(duration).utc.strftime('%H:%M:%S')
  end
end

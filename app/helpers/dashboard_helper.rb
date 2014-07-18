module DashboardHelper
  def display_duration time
    Time.at(time).utc.strftime('%H:%M:%S')
  end

  def display_datetime datetime
    datetime.strftime('%m/%d/%Y - %l:%M %p')
  end
end

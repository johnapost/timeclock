class DashboardController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def index
    if @user.active_clock?
      @time_log = @user.time_logs.first
    else
      @time_log = TimeLog.new
    end
    @date = DateTime.now
    @time_logs = @user.time_logs.where(clock_in: @date.advance(days: -7)..@date.end_of_day).where.not(clock_out: nil)
  end
end

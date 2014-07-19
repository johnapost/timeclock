class DashboardController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def index
    @time_log = TimeLog.new
    @time_logs = @user.time_logs.seven_days

    if @user.admin?
      @employees = User.where(role: 1)
    end
  end
end

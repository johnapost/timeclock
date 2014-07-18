class TimeLogsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  respond_to :js

  def create
    @time_log = TimeLog.new time_log_params
    @time_log.clock_in = DateTime.now

    if @time_log.save
      @alert = "Successfully clocked in at #{@time_log.clock_in}"
    else
      @alert = 'Unable to clock in.'
    end
  end

  def update
    @time_log = TimeLog.find params[:id]

    if @time_log.update_attributes time_log_params
      @alert = "Successfully clocked out at #{@time_log.clock_out}"
    else
      @alert = 'Unable to clock out.'
    end
  end

  private
    def time_log_params
      params.require(:time_log).permit(:id, :user_id)
    end
end

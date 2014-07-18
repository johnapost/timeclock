class TimelogsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  respond_to :json

  def create
    @time_log = TimeLog.create time_log_params

    if @time_log.save
      flash.now[:notice] = "Successfully clocked in at #{@time_log.clocked_in}"
    else
      flash.now[:alert] = 'Unable to clock in.'
    end
  end

  def update
    @time_log = TimeLog.find params[:id]

    if @time_log.update_attributes time_log_params
      flash.now[:notice] = "Successfully clocked out at #{@time_log.clocked_out}"
    else
      flash.now[:alert] = 'Unable to clock out.'
    end
  end

  private
    def time_log_params
      params.require(:time_log).permit(:user_id, :clock_in, :clock_out)
    end
end

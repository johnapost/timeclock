class TimeLogsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  respond_to :js

  def create
    @time_log = TimeLog.new time_log_params
    @time_log.clock_in = DateTime.now

    if TimeLog.where(id: @time_log.id).any?
      @message = {text: 'That ID already exists. Please try a different one.', type: 'danger'}
    else
      if @time_log.save
        @message = {text: "Successfully clocked in at #{@time_log.display_clock_in}.", type: 'success'}
      else
        @message = {text: 'Unable to clock in.', type: 'danger'}
      end
    end
  end

  def update
    @time_log = TimeLog.find params[:id]
    @time_log.clock_out = DateTime.now

    if @time_log.update_attributes time_log_params
      @message = {text: "Successfully clocked out at #{@time_log.display_clock_out} with a duration of #{@time_log.duration}", type: 'success'}
    else
      @message = {text: 'Unable to clock out.', type: 'danger'}
    end
  end

  private
    def time_log_params
      params.require(:time_log).permit(:id, :user_id)
    end
end

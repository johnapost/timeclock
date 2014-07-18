class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for resource
    dashboard_path
  end

  def after_sign_out_path_for resource
    root_path
  end

  private

    def get_user
      @user = current_user if user_signed_in?
    end

    def block_employee
      redirect_to dashboard_path, alert: 'You do not have sufficient access.' if @user.role == 'employee'
    end
end

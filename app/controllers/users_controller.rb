class UsersController < ApplicationController
  before_filter :authenticate_user!, :get_user, :block_employee

  def index
    @users = User.all
    @new_user = User.new
  end

  def destroy
    @user = User.find params[:id]

    respond_to do |format|
      format.js do
        if @user.destroy
          @message = {text: "Successfully deleted #{@user.display_name}.", type: 'success'}
        else
          @message = {text: "Unable to delete #{@user.display_name}.", type: 'danger'}
        end
      end
    end
  end
end

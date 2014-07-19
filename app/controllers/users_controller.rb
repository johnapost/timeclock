class UsersController < ApplicationController
  before_filter :authenticate_user!, :get_user, :block_employee

  def index
    @users = User.all
    @new_user = User.new
  end

  def create
    @new_user = User.new user_params

    respond_to do |format|
      format.js do
        if User.where(id: @new_user.id).any?
          @message = {text: 'That ID already exists. Please try a different one.', type: 'danger'}
        else
          if @new_user.save
            @message = {text: "Successfully created #{@user.display_name}.", type: 'success'}
          else
            @message = {text: "Unable to create #{@user.display_name}", type: 'danger'}
            puts @new_user.errors.full_messages
          end
        end
      end
    end
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

  private
    def user_params
      params.require(:user).permit(:id, :role, :email, :first_name, :last_name, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  before_filter :authenticate_user!, :get_user, :block_employee

  def index
    @users = User.all
  end
end

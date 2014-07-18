class DashboardController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def index
  end
end

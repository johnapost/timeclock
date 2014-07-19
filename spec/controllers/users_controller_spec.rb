require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before (:each) do
    @user = FactoryGirl.create :admin
    sign_in @user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

end

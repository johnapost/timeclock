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

  describe "POST 'create'" do
    it "returns http success" do
      @new_user = FactoryGirl.build :employee
      xhr :post, :create, {
        user: {
          id: @new_user.id,
          role: @new_user.role,
          email: @new_user.email,
          first_name: @new_user.first_name,
          last_name: @new_user.last_name,
          password: @new_user.password,
          password_confirmation: @new_user.password_confirmation
        }
      }
      expect(response).to be_success
    end
  end

  describe "POST 'destroy'" do
    it "returns http success" do
      xhr :post, :destroy, {id: FactoryGirl.create(:employee).id}
      expect(response).to be_success
    end
  end

end

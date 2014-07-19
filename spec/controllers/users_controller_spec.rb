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
    it "returns http success", js: true do
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

    describe 'with invalid user' do
      render_views

      it "rerenders the form", js: true do
        @new_user = FactoryGirl.build :employee
        xhr :post, :create, {
          user: {
            id: @user.id,
            role: @new_user.role,
            email: @new_user.email,
            first_name: @new_user.first_name,
            last_name: @new_user.last_name,
            password: @new_user.password,
            password_confirmation: @new_user.password_confirmation
          }
        }
        expect(response).to render_template(partial: '_form')
      end
    end

    describe 'with invalid params' do
      render_views

      it "rerenders the form", js: true do
        @new_user = FactoryGirl.build :employee
        xhr :post, :create, {
          user: {
            id: @new_user.id,
            role: @new_user.role,
            email: @new_user.email,
            first_name: @new_user.first_name,
            last_name: @new_user.last_name,
            password: @new_user.password,
            password_confirmation: 'invalid'
          }
        }
        expect(response).to render_template(partial: '_form')
      end
    end
  end

  describe "POST 'destroy'" do
    describe 'with valid params' do
      it "returns http success", js: true do
        xhr :post, :destroy, {id: FactoryGirl.create(:employee).id}
        expect(response).to be_success
      end
    end

    describe 'with invalid params' do
      render_views

      it "returns an error message", js: true do
        xhr :post, :destroy, {id: @user.id}
        expect(response.body).to include 'Unable to delete'
      end
    end
  end
end

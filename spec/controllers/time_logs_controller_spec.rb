require 'rails_helper'

RSpec.describe TimeLogsController, type: :controller do

  describe 'as an admin' do
    before (:each) do
      @user = FactoryGirl.create :user_with_time_log
      sign_in @user
    end

    describe "POST 'create'" do
      it "returns http success" do
        xhr :post, :create, {time_log: {user: @user}}
        expect(response).to be_success
      end
    end

    describe "POST 'update'" do
      it "returns http success" do
        xhr :post, :update, {id: @user.id, time_log: {id: @user.time_logs.first.id}}
        expect(response).to be_success
      end
    end
  end

end

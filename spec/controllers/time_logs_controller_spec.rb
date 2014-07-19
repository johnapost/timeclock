require 'rails_helper'

RSpec.describe TimeLogsController, type: :controller do
  describe 'as an admin' do
    before (:each) do
      @user = FactoryGirl.create :user_with_time_log
      sign_in @user
    end

    describe "POST 'create'" do
      describe 'with valid params' do
        it "returns http success" do
          xhr :post, :create, {time_log: {user: @user}}
          expect(response).to be_success
        end
      end

      describe 'with invalid params' do
        render_views

        it "returns http success" do
          @new_user = FactoryGirl.build :user
          xhr :post, :create, {time_log: {id: @user.time_logs.first.id, user_id: @new_user.id}}
          expect(response).to be_success
        end
      end
    end

    describe "POST 'update'" do
      it "returns http success" do
        @time_log = FactoryGirl.create :active_time_log, user: @user
        xhr :post, :update, {id: @time_log.id, time_log: {id: @time_log.id}}
        expect(response).to be_success
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer          default(1), not null
#  last_name              :string(255)
#  first_name             :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.create :user_with_active_clock}

  it 'gives active_clock?' do
    expect(user.active_clock?).to eq true
  end

  it 'gives display_name' do
    expect(user.display_name).to eq "#{user.first_name} #{user.last_name}"
  end

  it 'gives status' do
    expect(user.status).to eq 'Clocked In'
  end
end

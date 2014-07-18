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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee, class: User do
    @password = Faker::Internet.password 8

    email Faker::Internet.email
    password @password
    password_confirmation @password
    role :employee
  end

  factory :admin, class: User do
    @password = Faker::Internet.password 8

    email Faker::Internet.email
    password @password
    password_confirmation @password
    role :admin
  end
end

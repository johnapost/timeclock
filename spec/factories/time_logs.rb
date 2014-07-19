# == Schema Information
#
# Table name: time_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  clock_in   :datetime
#  clock_out  :datetime
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_log do
    clock_in DateTime.now.advance(hours: -1)
    clock_out DateTime.now

    factory :active_time_log do
      clock_out nil
    end
  end
end

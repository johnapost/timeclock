# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_log do
    user nil
    clock_in "2014-07-17 21:19:32"
    clock_out "2014-07-17 21:19:32"
  end
end

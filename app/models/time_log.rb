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

class TimeLog < ActiveRecord::Base
  belongs_to :user

  default_scope {order(clock_in: :desc)}

  def duration
    self.clock_out - self.clock_in if self.clock_out && self.clock_in
  end
end

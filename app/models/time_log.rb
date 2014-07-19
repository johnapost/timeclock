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

  validate :user_id, :clock_in, presence: true

  def duration
    self.clock_out - self.clock_in if self.clock_out && self.clock_in
  end

  def display_duration
    Time.at(self.duration.to_i).utc.strftime('%H:%M:%S') if self.duration
  end

  def display_clock_in
    self.clock_in.strftime('%m/%d/%Y - %l:%M %p')
  end

  def display_clock_out
    self.clock_out.strftime('%m/%d/%Y - %l:%M %p')
  end
end

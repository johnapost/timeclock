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
  scope :seven_days, -> {where(clock_in: DateTime.now.advance(days: -7).beginning_of_day..DateTime.now.end_of_day).where.not(clock_out: nil)}

  validate :user_id, :clock_in, presence: true
  validate :user_exists

  def duration
    if self.clock_out && self.clock_in
      self.clock_out.to_i - self.clock_in.to_i
    elsif self.clock_in
      Time.now.to_i - self.clock_in.to_i
    end
  end

  def display_duration
    Time.at(self.duration).utc.strftime('%H:%M:%S') if self.duration
  end

  def display_clock_in
    self.clock_in.strftime('%m/%d/%Y - %l:%M %p')
  end

  def display_clock_out
    self.clock_out.strftime('%m/%d/%Y - %l:%M %p')
  end

  private

    def user_exists
      errors.add(:user_id, 'user does not exist') unless User.exists?(self.user_id)
    end
end

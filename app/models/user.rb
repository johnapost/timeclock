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

class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable

  default_scope {order(id: :asc)}

  has_many :time_logs, dependent: :destroy

  enum role: {admin: 0, employee: 1} unless instance_methods.include? :role

  def active_clock?
    self.time_logs.where(clock_out: nil).any?
  end

  def display_name
    "#{self.first_name} #{self.last_name}"
  end

  def status
    self.active_clock? ? 'Clocked In' : 'Clocked Out'
  end
end

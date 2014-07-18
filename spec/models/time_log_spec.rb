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

require 'rails_helper'

RSpec.describe TimeLog, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

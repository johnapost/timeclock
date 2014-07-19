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
  let(:time_log) {FactoryGirl.build :time_log}

  it 'gives duration' do
    expect(time_log.duration).to eq 3600
  end

  it 'gives display_duration' do
    expect(time_log.display_duration).to eq '01:00:00'
  end

  it 'gives display_clock_in' do
    expect(time_log.display_clock_in).to eq time_log.clock_in.strftime('%m/%d/%Y - %l:%M %p')
  end

  it 'gives display_clock_out' do
    expect(time_log.display_clock_out).to eq time_log.clock_out.strftime('%m/%d/%Y - %l:%M %p')
  end
end
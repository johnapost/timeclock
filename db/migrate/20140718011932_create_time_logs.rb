class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.references :user, index: true
      t.datetime :clock_in
      t.datetime :clock_out

      t.timestamps
    end
  end
end

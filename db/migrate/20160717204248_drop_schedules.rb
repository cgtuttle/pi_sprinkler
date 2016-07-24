class DropSchedules < ActiveRecord::Migration
  def up
  	drop_table :schedules
  end
end

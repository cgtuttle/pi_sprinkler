class ChangeDurationBackToInteger < ActiveRecord::Migration
  def change
  	remove_column :program_stations, :duration
  	add_column :program_stations, :duration, :integer
  end
end

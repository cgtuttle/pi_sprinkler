class AddStartTimeToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :start_time, :time
  end
end

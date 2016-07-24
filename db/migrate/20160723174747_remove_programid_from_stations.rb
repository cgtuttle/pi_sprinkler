class RemoveProgramidFromStations < ActiveRecord::Migration
  def change
  	remove_column :stations, :program_id, :integer
  end
end

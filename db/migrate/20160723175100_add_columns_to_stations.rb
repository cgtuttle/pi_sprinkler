class AddColumnsToStations < ActiveRecord::Migration
  def change
  	add_column :stations, :number, :integer
  	add_column :stations, :location, :string
  end
end

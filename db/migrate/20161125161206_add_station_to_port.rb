class AddStationToPort < ActiveRecord::Migration
  def change
  	add_reference :ports, :station, foreign_key: true
  end
end

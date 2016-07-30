class AddPortToStation < ActiveRecord::Migration
  def change
    add_reference :stations, :port, index: true, foreign_key: true
  end
end

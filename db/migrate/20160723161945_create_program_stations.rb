class CreateProgramStations < ActiveRecord::Migration
  def change
    create_table :program_stations do |t|
      t.references :program, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true
      t.integer :sequence
      t.time :duration

      t.timestamps null: false
    end
  end
end

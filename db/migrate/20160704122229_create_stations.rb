class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.references :program, index: true, foreign_key: true
      t.integer :sequence
      t.integer :duration

      t.timestamps null: false
    end
  end
end

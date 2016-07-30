class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.integer :pin_id
      t.string :gpio
      t.integer :port_number

      t.timestamps null: false
    end
  end
end

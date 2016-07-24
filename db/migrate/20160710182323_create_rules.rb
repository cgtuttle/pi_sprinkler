class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.string :group
      t.boolean :exclusive

      t.timestamps null: false
    end
  end
end

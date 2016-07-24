class AddEnabledToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :enabled, :boolean, default: true, null: false
  end
end

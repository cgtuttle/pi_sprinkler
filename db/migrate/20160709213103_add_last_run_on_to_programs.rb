class AddLastRunOnToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :last_run_on, :datetime
  end
end

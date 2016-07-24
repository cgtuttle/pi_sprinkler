class CreateProgramRules < ActiveRecord::Migration
  def change
    create_table :program_rules do |t|
      t.references :program, index: true, foreign_key: true
      t.string :rule

      t.timestamps null: false
    end
  end
end

class RemoveRuleFromProgramRules < ActiveRecord::Migration
  def change
    remove_column :program_rules, :rule, :string
  end
end

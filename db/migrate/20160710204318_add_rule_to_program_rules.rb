class AddRuleToProgramRules < ActiveRecord::Migration
  def change
    add_reference :program_rules, :rule, index: true, foreign_key: true
  end
end

json.array!(@program_rules) do |program_rule|
  json.extract! program_rule, :id, :program_id, :rule
  json.url program_rule_url(program_rule, format: :json)
end

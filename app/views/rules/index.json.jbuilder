json.array!(@rules) do |rule|
  json.extract! rule, :id, :name, :group, :exclusive
  json.url rule_url(rule, format: :json)
end

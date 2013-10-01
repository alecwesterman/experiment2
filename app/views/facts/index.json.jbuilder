json.array!(@facts) do |fact|
  json.extract! fact, :body
  json.url fact_url(fact, format: :json)
end

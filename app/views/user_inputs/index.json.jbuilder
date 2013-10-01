json.array!(@user_inputs) do |user_input|
  json.extract! user_input, :body
  json.url user_input_url(user_input, format: :json)
end

json.array!(@sales) do |sale|
  json.extract! sale, :id, :date, :code, :value, :hashed_password
  json.url sale_url(sale, format: :json)
end

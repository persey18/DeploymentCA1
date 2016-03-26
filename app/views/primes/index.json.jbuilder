json.array!(@primes) do |prime|
  json.extract! prime, :id, :primenum
  json.url prime_url(prime, format: :json)
end

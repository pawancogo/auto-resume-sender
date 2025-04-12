Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://localhost:3000'  # React frontend or client origin
    origins '*'

    resource '*',
      headers: :any,
      # credentials: true,  # Needed if you're sending cookies/auth tokens
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

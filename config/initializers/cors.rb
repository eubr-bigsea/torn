# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['RAILS_CORS_ORIGINS'].to_s, 'http://localhost:8080', %r{https?://localhost:(\d*)}

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose:  %w[Authorization uid],
             max_age: 60_000
  end
end

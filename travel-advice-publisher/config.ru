require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV["REDIS_HOST"] || "127.0.0.1",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "travel-advice-publisher",
  }
end

require 'sidekiq/web'
map '/travel-advice-publisher' do
  run Sidekiq::Web
end

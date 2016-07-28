require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: "redis-1.backend",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "travel-advice-publisher",
  }
end

require 'sidekiq/web'
map '/travel-advice-publisher' do
  run Sidekiq::Web
end

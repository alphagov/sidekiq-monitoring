require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: "redis-1.backend",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "publishing-api",
  }
end

require 'sidekiq/web'
map '/publishing-api' do
  run Sidekiq::Web
end

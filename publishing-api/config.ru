require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV["REDIS_HOST"] || "127.0.0.1",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "publishing-api",
  }
end

require 'sidekiq/web'
map '/publishing-api' do
  run Sidekiq::Web
end

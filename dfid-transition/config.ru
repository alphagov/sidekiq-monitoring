require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: "redis-1.backend",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "dfid-transition",
  }
end

require 'sidekiq/web'
map '/dfid-transition' do
  run Sidekiq::Web
end

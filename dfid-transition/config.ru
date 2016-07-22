require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV["REDIS_HOST"] || "127.0.0.1",
    port: ENV["REDIS_PORT"] || 6379,
    namespace: "dfid-transition",
  }
end

require 'sidekiq/web'
map '/dfid-transition' do
  run Sidekiq::Web
end

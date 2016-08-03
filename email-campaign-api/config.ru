require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = YAML.load_file(File.join(__dir__, 'redis.yml')).symbolize_keys
end

map '/email-campaign-api' do
  run Sidekiq::Web
end

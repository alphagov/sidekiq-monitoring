require 'sidekiq/web'

app_name = ENV.fetch('GOVUK_APP_NAME')

redis_prefix = app_name.tr('-', '_').upcase
redis_host = ENV.fetch("#{redis_prefix}_REDIS_HOST", 'localhost')
redis_port = ENV.fetch("#{redis_prefix}_REDIS_PORT", 6379)
redis_namespace = app_name

Sidekiq.configure_client do |config|
  config.redis = { host: redis_host, port: redis_port, namespace: redis_namespace }
end

map "/#{app_name}" do
  run Sidekiq::Web
end

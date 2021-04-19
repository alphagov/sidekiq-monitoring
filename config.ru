require 'sidekiq/web'
require 'govuk_app_config'

app_name = ENV.fetch('GOVUK_APP_NAME')

redis_prefix = app_name.tr('-', '_').upcase
redis_url = ENV.fetch("#{redis_prefix}_REDIS_URL", 'redis://localhost:6379')
redis_namespace = app_name

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, namespace: redis_namespace }
end

map "/#{app_name}" do
  run Sidekiq::Web
end

map "/healthcheck" do
  run GovukHealthcheck.rack_response(GovukHealthcheck::SidekiqRedis)
end

map "/healthcheck/live" do
  run Proc.new { [200, {}, %w[OK]] }
end

map "/healthcheck/ready" do
  run GovukHealthcheck.rack_response(GovukHealthcheck::SidekiqRedis)
end

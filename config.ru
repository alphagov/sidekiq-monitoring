# We seem to need this extra require for rack < 3 and Sidekiq 5, otherwise we
# get a DelegateClass error
# https://onigra.github.io/blog/2020/02/24/undefined-method-delegate-class-on-rack-session-cookie/
require "delegate"
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

map "/healthcheck/live" do
  run Proc.new { [200, {}, %w[OK]] }
end

map "/healthcheck/ready" do
  run GovukHealthcheck.rack_response(GovukHealthcheck::SidekiqRedis)
end

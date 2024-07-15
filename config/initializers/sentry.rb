Sentry.init do |config|
  config.dsn = 'https://b2372d8e2b9e4d65b5bd284d18376683@o4505175433609216.ingest.sentry.io/4505375025528832'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
# frozen_string_literal: true

require ::File.expand_path('redmine_sentry_client/helper/sentry_helper', __dir__)

# Helper library to integrate sentry
module RedmineSentryClient
  class << self
    # return SENTRY_ACTIVE environment variable.
    # If the environment variable is not set, fallback to true.
    def active
      ENV.fetch('SENTRY_ACTIVE', 'true').casecmp('true').zero?
    end

    def traces_sample_rate
      Setting.plugin_redmine_sentry_client['traces_sample_rate'].to_d || 0.5
    end

    def environment
      Setting.plugin_redmine_sentry_client['environment'] || Rails.env
    end

    def dsn
      Setting.plugin_redmine_sentry_client['dsn'] || ''
    end

    def report_error(error)
      SentryHelper.init_sentry unless @sentry_initialized
      Sentry.capture_exception(error)
    end
  end
end

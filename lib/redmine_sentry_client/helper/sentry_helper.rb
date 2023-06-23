# frozen_string_literal: true

module RedmineSentryClient
  module Helper
    # Module to initialize sentry
    class SentryHelper
      def self.init_sentry
        return unless RedmineSentryClient.active

        begin
          Sentry.init do |config|
            config.dsn = RedmineSentryClient.dsn
            config.environment = RedmineSentryClient.environment
            config.breadcrumbs_logger = %i[active_support_logger http_logger]

            config.traces_sample_rate = RedmineSentryClient.traces_sample_rate
          end
          @sentry_initialized = true
        rescue => e
          Rails.logger.error "Failed to initialize Sentry: #{e.message}"
        end
      end
    end
  end
end

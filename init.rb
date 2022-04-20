# Global Hooks
require File.expand_path('../lib/redmine_sentry_client/helper/sentry_helper', __FILE__)

Redmine::Plugin.register :redmine_sentry_client do
  name 'Sentry Client'
  author 'jop-software Inh. Johannes Przymusinski'
  description 'This plugins integrates the sentry sdk to report internal redmine errors to sentry'
  version '1.1.0'
  url 'https://github.com/jop-software/redmine_sentry_client'
  author_url 'http://www.jop-software.de'

  requires_redmine :version_or_higher => '4.2.0'

  settings(
    default: {
      "dsn" => ENV["SENTRY_DSN"] || "",
      "environment" => ENV["SENTRY_ENVIRONMENT"] || "",
      "traces_sample_rate" => ENV["SENTRY_TRACES_SAMPLE_RATE"] || 0.5,
    },
    partial: 'settings/sentry_settings'
  )
end

RedmineSentryClient::Helper::SentryHelper.init()

require 'redmine'

Redmine::Plugin.register :redmine_sentry_client do
  name 'Sentry Client'
  author 'jop-software Inh. Johannes Przymusinski'
  description 'This plugins integrates the sentry sdk to report internal redmine errors to sentry'
  version '1.0.0'
  url 'https://github.com/jop-software/redmine_sentry_client'
  author_url 'http://www.jop-software.de'

  requires_redmine :version_or_higher => '4.2.0'

  settings(
    default: {
      "dsn" => ENV["SENTRY_DSN"] || "",
      "environment" => ENV["SENTRY_ENVIRONMENT"] || "",
      "traces_sample_rate" => ENV["SENTRY_TRACES_SAMMPLE_RATE"] || 0.5,
    },
    partial: 'settings/sentry_settings'
  )
end

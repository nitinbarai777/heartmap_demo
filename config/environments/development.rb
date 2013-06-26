Heartmap::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.i18n.default_locale = :en

  # Don't care if the mailer can't send
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  BASE_URL = "http://local.myapp.com"
  BASE_URL_DOMAIN = "local.myapp.com"
  MAIL_USER_NAME = "nitinbarai.virtueinfo@gmail.com"
  MAIL_PASSWORD = "nitin@@@777"
  MAIL_PORT = "587"
  MAIL_ADDRESS = "smtp.gmail.com"
  MAIL_DOMAIN = "gmail.com"
  FACEBOOK_API = "147816275396773"
  FACEBOOK_SECRET = "5c905afe7fbe94ed314563fce8234016"
  TWITTER_API = "YJyVH0qqskvVIyzBpAf8Q"
  TWITTER_SECRET = "Gy9VFWraDCGaoAfUQtLHj2a18HkgcnfpNSXnImBbag"
  GOOGLE_API = "407115079739-hrd314np4q6r44gjsqbd42evtk8a3r83.apps.googleusercontent.com"
  GOOGLE_SECRET = "4u5dn8_B_Qg_pHQy6QdnmJDz"
  LINKEDIN_CONSUMER_KEY = "wj42exdxm4x1"
  LINKEDIN_CONSUMER_SECRET = "TfjSF2yvfAJrDhIH"
end

Kleberetalita::Application.configure do

  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  # config.assets.compress = false
  config.assets.debug = true

  # Expands the lines which load the assets
  config.assets.debug = true

  # config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # config.action_mailer.perform_deliveries = true 
  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   address:              'smtp.gmail.com',
  #   port:                 587,
  #   domain:               'gmail.com',
  #   user_name:            'kleberpinel@gmail.com',
  #   password:             'TalitaSack@#09@5',
  #   authentication:       'plain',
  #   enable_starttls_auto: true  
  # }

  # ActionMailer::Base.smtp_settings = {
  #     :port =>           '587',
  #     :address =>        'smtp.mandrillapp.com',
  #     :user_name =>      'kleberpinel@gmail.com',
  #     :password =>       '2K-ZFXzD9FDaKqAYwu--fA',
  #     :domain =>         'heroku.com',
  #     :authentication => :plain
  # }
  # ActionMailer::Base.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "app3265569@heroku.com",
    :password  => "nbVQ7kQdND9q9_-vEW8lYg", # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'kleberetalita.com', # your domain to identify your server when connecting
  }
  ActionMailer::Base.delivery_method = :smtp

end

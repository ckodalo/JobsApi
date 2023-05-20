require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JobsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
   
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
       # Must add these lines!
    # Adding back cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

   
    # config/initializers/session_store.rb
    # config.session_store :cookie_store, key: '_jobs_api_session', domain: :all, tld_length: 2, secure: true, same_site: :none


    # Rails.application.config.session_store :cookie_store, key: '_my_app_session', domain: :all


    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:4000', 'https://mtandao.xyz'
        resource '*', headers: :any, methods: %i[get patch put delete post options show], credentials: true
      end
    end
    
  # Use SameSite=Strict for all cookies to help protect against CSRF
    

        #  config.action_dispatch.cookies_same_site_protection = :strict
        #  config.ssl_options = { hsts: { subdomains: true } }

        # config.force_ssl = true
    # Skip views, helpers and assets when generating a new resource.
     config.api_only = true
  end
end

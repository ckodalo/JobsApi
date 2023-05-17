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
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore

    Rails.application.config.middleware.use ActionDispatch::Cookies do
      # Set the same_site option to :none to disable the SameSite attribute
      config.same_site = :none
    end
    
    Rails.application.config.middleware.use ActionDispatch::Session::CookieStore
    

    # Rails.application.config.session_store :cookie_store, key: '_my_app_session', domain: :all



    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins 'http://localhost:4000'
    #     resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    #   end
    # end

    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://mtandao.xyz'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
    
  

    ## this configuration may be useful to avoid errors 
    # config.middleware.insert_before 0, Rack::Cors do 
    #   allow do 
    #     origins '*' 
    #     resource( '*', headers: :any, expose: ['Authorization'], methods: %i[get patch put delete post options show] ) 
      
    #   end 
    # end
    
    
    # Use SameSite=Strict for all cookies to help protect against CSRF
    
         config.action_dispatch.cookies_same_site_protection = :strict
        # config.force_ssl = true
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end

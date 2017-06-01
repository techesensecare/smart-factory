require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SmartFactory
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Buenos Aires'
    config.i18n.default_locale = 'pt-BR'
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
    end

    # Proxy para acessar S3 como se fossem no mesmo domínio.
    # Ref: https://github.com/waterlink/rack-reverse-proxy
    config.middleware.insert(0, Rack::ReverseProxy) do
      reverse_proxy_options preserve_host: false
      reverse_proxy '/smart-factory', 'http://s3.amazonaws.com/smart-factory'
    end
  end
end

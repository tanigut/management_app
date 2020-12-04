require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManagementApp
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = "Tokyo"
    config.i18n.load_path +=
      Dir[Rails.root.join("config", "locals", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
    	g.skip_routes true
    	g.helper false
    	g.assets false
    	g.test_framework :rspec
    	g.controller_specs false
    	g.view_specs false
    end
  end
end

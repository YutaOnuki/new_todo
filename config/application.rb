require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TodoVer2
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework :rspec,
            view_specs: false,
            helper_specs: false,
            controller_specs: true,
            routing_specs: true
    end
  end
end

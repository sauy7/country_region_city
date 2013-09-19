require File.expand_path('../boot', __FILE__)
require "active_record/railtie"
require "action_controller/railtie"
require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env)

module CountryRegionCity
  class Application < Rails::Application
    config.assets.enabled = false

    # Set environment variables. Typically used in development and test environments.
    # Can also be used for production and staging, or
    # Heroku: Set environment variables usual Heroku way
    #         See https://devcenter.heroku.com/articles/config-vars
    # Engine Yard: Set environment variables using a custom chef recipe
    #              See https://github.com/engineyard/ey-cloud-recipes/tree/master/cookbooks/api-keys-yml
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', "env_vars_#{Rails.env}.yml")
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end

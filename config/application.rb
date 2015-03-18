require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FayeRailsExample
  class Application < Rails::Application
    config.middleware.use Faye::RackAdapter, :mount => '/faye', :timeout => 25  do |bayeux|
      bayeux.add_extension(FayeJoy.new)
    end
  end
end

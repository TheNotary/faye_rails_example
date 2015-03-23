# This file is used by Rack-based servers to start the application.

#require 'faye'

require ::File.expand_path('../config/environment',  __FILE__)

use Faye::RackAdapter, :mount => '/faye', :timeout => 25 do |bayeux|
  bayeux.add_extension(FayeJoy.new)
end

run Rails.application

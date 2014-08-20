require_relative "app"
require "sprockets"

map "/" do
  set :cometio, :timeout => 120, :post_interval => 2, :allow_crossdomain => false
  set :websocketio, :port => 5001
  set :rocketio, :websocket => true, :comet => true
  run Application
end

map "/js" do
  env = Sprockets::Environment.new
  env.append_path 'vendor/assets/coffee'
  env.append_path 'bower_components'
  run env
end


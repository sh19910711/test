require_relative "app"
require "sprockets"

map "/" do
  run Application
end

map "/js" do
  env = Sprockets::Environment.new
  env.append_path 'vendor/assets/coffee'
  env.append_path 'bower_components'
  run env
end


require_relative "app"
require "sprockets"

map "/" do
  set :websocketio, :port => 5000
  run Application
end

map "/css" do
  env = Sprockets::Environment.new
  env.css_compressor = :sass
  env.append_path "vendor/assets/sass"
  run env
end

map "/js/app" do
  env = Sprockets::Environment.new
  env.append_path "vendor/assets/coffee"
  run env
end

map "/js/lib" do
  env = Sprockets::Environment.new
  env.append_path "dist/js/lib/"
  run env
end


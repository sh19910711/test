require_relative "app"
require "sprockets"

map "/" do
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
  env.append_path "bower_components"
  run env
end


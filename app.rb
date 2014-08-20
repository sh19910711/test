require "sinatra"
require "haml"

if development?
  require "sinatra/reloader"
end

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    haml :main
  end
end


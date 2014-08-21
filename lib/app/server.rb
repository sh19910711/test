require "sinatra"
require "slim"

if development?
  require "sinatra/reloader"
end

module App
  class Server < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    get "/hello" do
      slim :hello
    end
  end
end


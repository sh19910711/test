module TypingForces

  class App < ::Padrino::Application

    register ::Padrino::Helpers

    get :index do
      "hello"
    end

  end

end

class FooController < ApplicationController

  def index
    @items = Item.all
    "hello"
  end

end

define ->
  class Foo
    @::Bar = require "foo/bar"
    @::View = require "foo/view"

    getVersion: ->
      VERSION

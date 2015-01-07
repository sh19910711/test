define ->
  class Foo
    @::Bar = require "foo/bar"
    @::View = require "foo/view"
    @::Flag = require "foo/flag" if ENABLE_FLAG

    getVersion: ->
      VERSION

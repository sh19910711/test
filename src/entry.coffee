jQuery = require("jquery")
jQuery ->
  Foo = require("foo")
  bar = new Foo::Bar
  bar.say() # -> hello

  foo = new Foo
  console.log "VERSION = #{foo.getVersion()}"

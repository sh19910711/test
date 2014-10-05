through = require "through2"
http = require "http"
connect = require "connect"
connect_coffee_script = require "connect-coffee-script"
serve_static = require "serve-static"
serve_index = require "serve-index"
path = require "path"
haml = require "hamljs"
fs = require "fs"

phantomochajs = (options)->
  app = connect()

  app.use serve_index(
    path.resolve("./")
  )

  app.use connect_coffee_script(
    src: "spec"
  )

  app.use serve_static(
    path.resolve("./")
  )

  app.use (req, res, next)->
    if req.url == "/test_runner.html"
      res.end haml.render fs.readFileSync "./lib/test_runner.haml"
    next()

  stream = through.obj (file, enc, cb)->
    webserver = http.createServer(app).listen(18080, "127.0.0.1")

  stream.on "kill", ->
    console.log stream
  stream.on "data", ->
    console.log "data", arguments
  stream.on "end", ->
    console.log "end", arguments
  return stream

module.exports = phantomochajs


require "bundler/setup"
require "highline"
require "stringio"

input_stream = StringIO.new
input_stream << "item-1" << $/
input_stream << "item-2" << $/
input_stream << "item-3" << $/
input_stream.rewind

terminal = ::HighLine.new(input_stream)

item1 = terminal.ask("item1> ")
puts "item1 = #{item1}"
puts ""

item2 = terminal.ask("item2> ") {|q| q.echo = '*' }
puts "item2 = #{item2}"
puts ""

item3 = terminal.ask("item3> ") {|q| q.echo = false }
puts "item3 = #{item3}"
puts ""


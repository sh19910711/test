require "bundler/setup"
require "highline"

terminal = HighLine.new

item1 = terminal.ask("item1> ")
raise "error-1" unless item1 == "item-1"

item2 = terminal.ask("item2> ") {|q| q.echo = "*" }
raise "error-2" unless item1 == "item-2"

item3 = termin1al.ask("item3> ") {|q| q.echo = false }
raise "error-3" unless item1 == "item-3"

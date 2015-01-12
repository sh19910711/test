require "bundler/setup"
require "highline"
require "stringio"
require "test/unit"

class TestInput < Test::Unit::TestCase

  attr_reader :input_stream
  attr_reader :output_stream
  attr_reader :terminal

  def setup
    @input_stream = StringIO.new
    @output_stream = StringIO.new
    @terminal = ::HighLine.new(input_stream, output_stream)
  end

  def test_1
    input_stream << "item-1" << $/
    input_stream << "item-2" << $/
    input_stream << "item-3" << $/
    input_stream.rewind

    item1 = terminal.ask("item1> ")
    assert_equal item1, "item-1"

    item2 = terminal.ask("item2> ") {|q| q.echo = '*' }
    assert_equal item2, "item-2"

    item3 = terminal.ask("item3> ") {|q| q.echo = false }
    assert_equal item3, "item-3"
  end

end


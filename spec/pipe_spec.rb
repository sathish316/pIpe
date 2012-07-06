require 'spec_helper'

describe Pipe::Pipe do
  describe "#execute" do
    it "should execute pipe if filter matched" do
      input = Pipe::Input::HackerNews.new
      filter = Pipe::Filter::JSONContains.new(title: 'Clojure')
      output = Pipe::Output::Gtalk.new(username: 'test', password: 'pass', recipient: 'recipient@gmail.com', message: 'Found clojure post in HackerNews')

      input.expects(:get).returns([
        {'rank' => 1, 'title' => 'Clojure is awesome'}
        ])
      output.expects(:post)

      pipe = Pipe::Pipe.new(input, filter, output)
      pipe.execute
    end

    it "should not execute pipe if filter does not match" do
      input = Pipe::Input::HackerNews.new
      filter = Pipe::Filter::JSONContains.new(title: 'Clojure')
      output = Pipe::Output::Gtalk.new(username: 'test', password: 'pass', recipient: 'recipient@gmail.com', message: 'Found clojure post in HackerNews')

      input.expects(:get).returns([
        {'rank' => 1, 'title' => 'Haskell is awesome'}
        ])
      output.expects(:post).never

      pipe = Pipe::Pipe.new(input, filter, output)
      pipe.execute
    end
  end
end
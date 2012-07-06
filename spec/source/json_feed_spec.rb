require 'spec_helper'

describe Pipe::Source::JSONFeed do
  describe "#get" do
    before(:each) do
      @url = 'http://test.com/hackernews.json'
      @posts = [
        {'rank' => '1', 'title' => "Haskell is awesome"},
        {'rank' => '2', 'title' => "Clojure is awesome"},
        {'rank' => '3', 'title' => "Make something people want"},
      ]
      FakeWeb.register_uri :get, @url, :body => @posts.to_json
    end

    it "should get data from Feed" do
      feed = Pipe::Source::JSONFeed.new(url: @url)
      feed.get.should == @posts
    end
  end
end
require 'spec_helper'

describe Pipe::Input::HackerNews do
  describe "#get" do
    before(:each) do
      url = "http://apify.heroku.com/api/hacker_news.json"
      @posts = [
        {'rank' => '1', 'title' => "Haskell is awesome"},
        {'rank' => '2', 'title' => "Clojure is awesome"},
        {'rank' => '3', 'title' => "Make something people want"},
      ]
      FakeWeb.register_uri :get, url, :body => @posts.to_json
    end

    it "should get data" do
      feed = Pipe::Input::HackerNews.new
      feed.get.should == @posts
    end
  end
end
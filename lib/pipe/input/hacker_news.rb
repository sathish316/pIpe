class Pipe::Input::HackerNews < Pipe::Source::JSONFeed
  def initialize(options={})
    super(url: 'http://apify.heroku.com/api/hacker_news.json')
  end
end
# export PIPE_PUSHOVER_USER=?? get your pushover user key
# export PIPE_PUSHOVER_API=avQMA3QTZ5cBlBczoMK7bqNkExmi2p
require 'rubygems'
require 'pipe'
hacker_news = Pipe::Input::HackerNews.new(url: 'http://apify.heroku.com/api/hacker_news.json')
iphone5_post = Pipe::Filter::JSONContains.new(attribute: 'title', contains: ' ')
pushover_message = Pipe::Output::Pushover.new(message: 'Found iPhone 5 post in HackerNews')
Pipe::Pipe.new(hacker_news, iphone5_post, pushover_message).execute

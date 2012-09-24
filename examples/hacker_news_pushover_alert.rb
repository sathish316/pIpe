#!/usr/bin/env ruby
# To execute with Pushover API key:
# $ PIPE_PUSHOVER_USER=username PIPE_PUSHOVER_API=apikey ruby examples/hacker_news_pushover_alert.rb

require 'rubygems'
require 'pipe'

hacker_news = Pipe::Input::HackerNews.new(url: 'http://apify.heroku.com/api/hacker_news.json')
iphone5_post = Pipe::Filter::JSONContains.new(attribute: 'title', contains: ' ')
pushover_message = Pipe::Output::Pushover.new(message: 'Found iPhone 5 post in HackerNews')
Pipe::Pipe.new(hacker_news, iphone5_post, pushover_message).execute
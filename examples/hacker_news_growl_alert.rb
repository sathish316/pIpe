#!/usr/bin/env ruby
# To execute with Growl outputs:
# $ ruby examples/hacker_news_growl_alert.rb

require 'rubygems'
require 'pipe'

hacker_news = Pipe::Input::HackerNews.new(url: 'http://apify.heroku.com/api/hacker_news.json')
ask_hn_post = Pipe::Filter::JSONContains.new(attribute: 'title', contains: 'Ask HN')
growl_message = Pipe::Output::GrowlApp.new(message: 'Found Ask HN Post')
pipe = Pipe::Pipe.new(hacker_news, ask_hn_post, growl_message)
pipe.execute
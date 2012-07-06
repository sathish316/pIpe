#!/usr/bin/env ruby
# To execute with Gtalk outputs:
# $ PIPE_GTALK_USER=abc PIPE_GTALK_PASS=def ruby examples/hacker_news_gtalk_alert.rb

require 'rubygems'
require 'pipe'
# require_relative '../lib/pipe' # for development

hacker_news = Pipe::Input::HackerNews.new(url: 'http://apify.heroku.com/api/hacker_news.json')
apple_post = Pipe::Filter::JSONContains.new(attribute: 'title', contains: 'Apple')
gtalk_message = Pipe::Output::Gtalk.new(recipient: 'sathish316@gmail.com', message: 'Found Apple post in HackerNews')
pipe = Pipe::Pipe.new(hacker_news, apple_post, gtalk_message)
pipe.execute
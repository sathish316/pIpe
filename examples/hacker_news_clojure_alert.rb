require 'rubygems'
require 'pipe'

hacker_news = Pipe::Input::HackerNews.new
clojure_post = Pipe::Filter::Contains.new(title: 'Clojure')
gtalk_message = Pipe::Output::Gtalk.new(username: 'sathish316')
task = Pipe::Pipe.new(hacker_news, clojure_post, gtalk_message)
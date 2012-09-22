## pIpe

ifttt is awesome for popular channels like Twitter, Facebook, Email etc. But if you want to customize channels to use any json or xml feed it isn't of much help.

pIpe is ifttt like library for websites/webservices linked to webservices/smartphones/desktops with advanced filters.

It is the ultimate in web automation. It will even work for website content.

See [Hacker News Gtalk Alert](https://github.com/sathish316/pIpe/blob/master/examples/hacker_news_gtalk_alert.rb) for example

```
hacker_news = Pipe::Input::HackerNews.new(url: 'http://apify.heroku.com/api/hacker_news.json')
iphone5_post = Pipe::Filter::JSONContains.new(attribute: 'title', contains: 'iPhone5')
gtalk_message = Pipe::Output::Gtalk.new(recipient: 'john@gmail.com', message: 'Found iPhone 5 post in HackerNews')
Pipe::Pipe.new(hacker_news, iphone5_post, gtalk_message).execute
```

To run this alert like ifttt, add [this script](https://github.com/sathish316/pIpe/blob/master/examples/hacker_news_gtalk_alert.rb) to crontab.

To install:

```
gem install pipe
```

Add to Gemfile:

```
gem 'pipe'
```

### Contribute

pIpe is still a work in progress and currently works only for JSON content and Gtalk notifications.

To contribute, fork and check out unfinished Sources, Sinks, Inputs, Outputs

### Source

Source can be:

1. Any json feed
2. Any xml/rss feed
3. Any website with changes detected from html
4. Twitter

### Sink

Events can be notified to:

1. Any webservice
2. Desktop notifications like Growl
3. iPhone / Android
4. Email, Instant Message, Text Message
5. Twitter, Google Calendar, Todo lists etc

### Filter

pIpe has advanced filters and will not be limited to one input and output.
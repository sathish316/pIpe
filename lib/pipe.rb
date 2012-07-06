require "pipe/version"
require 'json'
require 'open-uri'
require 'active_support'
require 'net/http'
require 'xmpp4r'
# require 'xmpp4r-simple'

module Pipe
  module Source
  end
  module Input
  end
  module Sink
  end
  module Output
  end
  module Filter
  end
end

['source', 'input', 'sink', 'output', 'filter'].each do |dir|
  Dir[File.dirname(__FILE__) + "/pipe/#{dir}/*.rb"].each do |path|
    require "pipe/#{dir}/#{File.basename(path)}"
  end
end

module Pipe
  class Pipe
    def initialize(input, filter, output)
      @input, @filter, @output = input, filter, output
    end

    def execute
      data = @input.get
      notify = data.any? {|datum| @filter.match?(datum)}
      @output.post if notify
    end
  end
end

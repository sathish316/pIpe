require "pipe/version"

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
    def initialize(source, filter, sink)
      @source, @filter, @sink = source, filter, sink
    end
  end
end

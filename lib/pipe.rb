require "pipe/version"

module Pipe
  class Pipe
    def initialize(source, filter, sink)
      @source, @filter, @sink = source, filter, sink
    end
  end
end

class Pipe::Source::JSONFeed
  def initialize(options={})
    @options = options
  end

  def get
    ActiveSupport::JSON.decode(open(@options[:url]).read)
  end
end
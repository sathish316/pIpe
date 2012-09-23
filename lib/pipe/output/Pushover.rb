class Pipe::Output::Pushover < Pipe::Sink::Pushover
  def initialize(options={})
    super(options.merge(user: ENV['PIPE_PUSHOVER_USER'], api_tok: ENV['PIPE_PUSHOVER_API']))
  end
end
class Pipe::Output::Gtalk < Pipe::Sink::InstantMessage
  def initialize(options={})
    super(options.merge(username: ENV['PIPE_GTALK_USER'], password: ENV['PIPE_GTALK_PASS']))
  end
end
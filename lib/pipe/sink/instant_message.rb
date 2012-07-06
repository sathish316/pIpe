class Pipe::Sink::InstantMessage
  def initialize(options={})
    @options = options
  end

  def post
    connect
    msg = ::Jabber::Message::new(@options[:recipient], @options[:message])
    msg.type=:chat
    @messenger.send(msg)
  end

  private

  def connect
    username = ::Jabber::JID::new(@options[:username])
    @messenger = ::Jabber::Client.new(username)
    @messenger.connect
    @messenger.auth(@options[:password])
    @messenger.send(::Jabber::Presence.new.set_type(:available))
  end
end
require 'spec_helper'

describe Pipe::Sink::InstantMessage do
  describe "#post" do
    before(:each) do
      pending
      @username, @password = 'testuser', 'testpass'
      ::Jabber::JID.expects(:new).with(@username).returns(jabber_id = mock('jabber_id'))
      ::Jabber::Client.expects(:new).with(jabber_id).returns(@messenger = mock('messenger'))
      @messenger.expects :connect
      @messenger.expects(:auth).with(@password)
      @messenger.expects(:send).with(::Jabber::Presence.new.set_type(:available))
    end

    it "should deliver message to recipient" do
      pending
      recipient, message = 'testrecipient', 'hello world'
      ::Jabber::Message.expects(:new).with(recipient, message).returns(msg = stub('msg'))
      msg.expects(:type=).with(:chat)
      @messenger.expects(:send).with(msg)

      im = Pipe::Sink::InstantMessage.new(username: @username, password: @password)
      im.post(recipient: recipient, message: message)
    end
  end
end
require 'spec_helper'

describe Pipe::Sink::Growl do
  
  describe "#register" do

    it "should throw an exception if Growl app is not available" do
      app = mock()
      app.expects(:by_id).with("com.Growl.GrowlHelperApp").returns(nil)
      Appscript.expects(:app).returns(app)
      lambda { Pipe::Sink::Growl.new }.should raise_error(Pipe::Sink::Growl::GrowlNotFound)
    end

    it "should throw an exception if Growl is not running" do
      app = mock()
      growl = mock()
      app.expects(:by_id).with("com.Growl.GrowlHelperApp").returns(growl)
      Appscript.expects(:app).returns(app)
      growl.expects(:is_running?).returns(false)
      lambda { Pipe::Sink::Growl.new }.should raise_error(Pipe::Sink::Growl::GrowlNotRunning)
    end

    it "should call growl register if running" do
      app = mock()
      growl = mock()
      app.expects(:by_id).with("com.Growl.GrowlHelperApp").returns(growl)
      Appscript.expects(:app).returns(app)
      growl.expects(:is_running?).returns(true)
      growl.expects(:register).once
      Pipe::Sink::Growl.new
    end

  end

  describe "#post" do
    before :each do
      app = mock()
      @growl = mock()
      app.stubs(:by_id).with("com.Growl.GrowlHelperApp").returns(@growl)
      Appscript.stubs(:app).returns(app)
      @growl.stubs(:is_running?).returns(true)
      @growl.stubs(:register)
    end

    it "should call growl notify" do
      params =  {app_name: "Tetris", sticky: true, priority: 2, message: 'Herr Hitler!'}
      @growl.expects(:notify).with(title: "Tetris", application_name: "Tetris", description: 'Herr Hitler!',
                                   sticky: true, priority: 2, with_name: 'pIpe notifications').once
      growl = Pipe::Sink::Growl.new(params)
      growl.post
    end
  end
  
end
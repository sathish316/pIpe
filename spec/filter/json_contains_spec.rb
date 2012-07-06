require 'spec_helper'

describe Pipe::Filter::JSONContains do
  describe "#match?" do
    it "should return true if object matches condition" do
      filter = Pipe::Filter::JSONContains.new(attribute: 'title', contains: 'Clojure')
      object = {'rank' => '1', 'title' => 'Clojure is awesome'}
      filter.should be_match(object)
    end

    it "should return false if object does not match condition" do
      filter = Pipe::Filter::JSONContains.new(attribute: 'title', contains: 'Clojure')
      object = {'rank' => '1', 'title' => 'Haskell is awesome'}
      filter.should_not be_match(object)
    end
  end
end
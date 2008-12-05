require File.dirname(__FILE__) + '/../spec_helper'

describe Accessory do
  before(:each) do
    @accessory = Accessory.new
  end

  it "should be valid" do
    @accessory.should be_valid
  end
end

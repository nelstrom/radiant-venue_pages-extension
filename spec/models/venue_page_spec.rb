require File.dirname(__FILE__) + '/../spec_helper'

describe VenuePage do
  before(:each) do
    @venue_page = VenuePage.new
  end

  it "should be valid" do
    @venue_page.should be_valid
  end
end

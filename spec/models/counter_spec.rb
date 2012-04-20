require 'spec_helper'

describe Counter do
  it "set user date to counter" do
    counter = Counter.new
    counter.user_date= "3/4/2010"
    counter.user_time= "10:15"
    
    counter.date.should eq("2010-04-03 10:15:00.000000000Z")
  end
  
  it "get date form counter" do
    counter = FactoryGirl.create(:counter)
    counter.user_date.should eq("20/04/2010")
#    counter.user_time.should eq("00:00")
  end
end
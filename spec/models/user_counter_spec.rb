require 'spec_helper'

describe UserCounter do
  
  it "should create new counter" do
    user_counters = UserCounter.find_all_or_create_by_user_id "12345678"
    counter = user_counters.first.counter

    counter.name.should eq("New Year")
    counter.date.should eq("2013-01-01 00:00:00.000000000Z")
    counter.title.should eq("default")
  end
  
  it "should find user counters" do
    FactoryGirl.create(:user_counter)
    user_counters = UserCounter.find_all_or_create_by_user_id "12345678"
    
    counter = user_counters.last.counter
    counter.name.should eq("Counter")
    counter.date.to_s(:long).should eq(2.years.ago.to_s(:long))
  end
  
end
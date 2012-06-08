class UserCounter < ActiveRecord::Base
  belongs_to :counter
  
  scope :activ, where(:hide => 0)
  scope :default, where(:title => :default)
  
  
  
  # Find all counters by user_id.
  # If user dont't have counter,
  # create default counter
  def self.find_all_or_create_by_user_id user_id
    counters = includes(:counter).activ.find_all_by_user_id user_id
    if counters.empty? && (self.default.find_by_user_id user_id).nil?
      counter = Counter.default.first
      user_counter = counter.user_counters.new(:user_id=>user_id,:title=>:default)
      user_counter.save
      return [user_counter]
    end
    counters
  end
end

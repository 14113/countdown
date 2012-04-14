class Counter < ActiveRecord::Base
  validates :date,
    :date => {:after => Proc.new { Date.today - 1.day  },
    :before => Proc.new { Date.today + 3.year} }
  validates :time, :presence => true,:if => :time_valid?
  validates :name, :presence => true
  
  def time_valid?
    begin
      unless self.time.min >= 0 && self.time.min < 60 && self.time.hour >=0 && self.time.hour < 24
        errors.add(:time, " must be on format mm:hh")
        return false
      else
        return true
      end
    rescue
      errors.add(:time, " must be on format mm:hh")
      return false
    end
  end
  
end

class Counter < ActiveRecord::Base
  #  validates :date,
  #    :date => {:after => Proc.new { Date.today - 1.day  },
  #    :before => Proc.new { Date.today + 3.year} }
  before_save :time ,:if => :time_valid?
  
  def time_valid?
    begin
      unless self.time.min >= 0 && self.time.min < 60 && self.time.hour >=0 && self.time.hour < 24
        errors.add(:time, " must be on format mm:hh")
        return false
      else
        return true
      end
    rescue
      return true
    end
  end
  
  def get_date
    self.date.strftime("%d/%m/%Y") unless self.date.nil?
  end
  
  def get_time
    if self.time.nil?
      "00:00"
    else
      self.time.strftime("%H:%M") 
    end
  end
  
end

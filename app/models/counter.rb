class Counter < ActiveRecord::Base
  has_many :user_counters, :dependent => :delete_all
  
  scope :default, where(:title => :default)

  def user_date=(date)
    d,m,y =  date.split("/")
    puts d.to_yaml
    puts m.to_yaml
    puts y.nil?
    if (d.nil? || m.nil? || y.nil?)
      self.date = DateTime.now()+1
    else
      self.date = DateTime.civil(y.to_i, m.to_i, d.to_i)
    end
  end
  
  def user_time=(time)
    h,m =  time.split(":")
    self.date = self.date.advance(:hours=>h.to_i) unless h.nil? 
    self.date = self.date.advance(:minutes=>m.to_i) unless m.nil?   
  end
  
  def user_date
    self.date.strftime("%d/%m/%Y") unless self.date.nil?
  end
  
  def user_time
    self.date.strftime("%H:%M") unless self.date.nil?
  end
  
end

class User
  attr_accessor  :user_id 
  
  def initialize(cookie)
    @cookies = cookie
    current_id
  end
  
  def to_s
    self.user_id
  end
  
  private
  def current_id
    if is_new?
      create_id
    else
      load_id
    end
  end
  
  def load_id
    self.user_id = @cookies[:user_id]
  end
  
  def create_id
    self.user_id,@cookies[:user_id] = Digest::SHA1.hexdigest(Time.now.to_s)
  end
  
  def is_new?
    @cookies[:user_id].nil?
  end
  
  
end

class UserCountersController < ApplicationController
  def index
    @user_counters = UserCounter.find_all_or_create_by_user_id @current_user
    @counter = Counter.new
  end
  
  def destroy
    @user_counter = UserCounter.find_by_id_and_user_id params[:id],@current_user
    if @user_counter.update_attributes(:hide=>1)
      redirect_to :action => "index"
    end
  end
  
  def show 
    @counter = UserCounter.find params[:id]
  end
  
end

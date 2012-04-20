class CountersController < ApplicationController
  
  def create
    
    @counter = Counter.new(params[:counter])
    @counter.user_counters.new(:user_id=>@current_user)
    @user_counter = @counter.user_counters
    respond_to do |format|
      if @counter.save
        format.html {redirect_to(root_path, :notice => 'Counter was successfully created.') }
        format.js { render }
      else
        @user_counter = Counter.find_all_by_user_id @current_user
        format.html{render :action=>"index" }
        format.js { render }
      end
    end
  end
end

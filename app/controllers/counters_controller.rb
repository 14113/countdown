class CountersController < ApplicationController
  def index
    @counter = Counter.new
    @counters = Counter.find_all_by_user_id @current_user
  end
  
  def destroy
    @counter = Counter.find_by_id_and_user_id params[:id],@current_user
    @counter.destroy
    redirect_to :action => "index"
  end
  def show 
    @counter = Counter.find params[:id]
  end
  
  def create
    @counter = Counter.new(params[:counter])
    @counter.user_id = @current_user
    
    respond_to do |format|
      if @counter.save
        format.html {redirect_to(root_path, :notice => 'Counter was successfully created.') }
        format.js { render }
      else
        format.html{render :action=>"index" }
        format.js { render }
      end
    end
  end
end

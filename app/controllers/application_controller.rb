class ApplicationController < ActionController::Base
  protect_from_forgery
   before_filter :authorize_user
   
  private
  def authorize_user
    @current_user = session[:session_id]
  end
end

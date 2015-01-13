class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  private

  def current_user
    if session[:admin_id]
      @current_user = Admin.find(session[:admin_id])
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end

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


  private
  def require_admin_login
    unless current_user && (current_user.is_a? Admin)
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_path
    end
  end

end

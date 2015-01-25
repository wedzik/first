class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    if session[:super_admin_id]
      @current_user = SuperAdmin.find(session[:super_admin_id])
    elsif session[:admin_id]
      @current_user = Admin.find(session[:admin_id])
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def require_admin_login
    unless current_user && (current_user.is_a? Admin)
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_path
    end
  end

  def require_super_admin_login
    unless current_user && (current_user.is_a? SuperAdmin)
      flash[:error] = "You must be logged in as super admin to access this section"
      redirect_to root_path
    end
  end

end

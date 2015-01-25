class SessionsController < ApplicationController

  def new
  end

  def new_admin
    render "new_admin"
  end

  def new_super_admin
    render "new_super_admin"
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def create_admin
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to users_url, :notice => "Logged in as Admin!"
    else
      flash.now.alert = "Invalid admin email or password"
      render "new_admin"
    end
  end

  def create_super_admin
    super_admin = SuperAdmin.authenticate(params[:email], params[:password])
    if super_admin
      session[:super_admin_id] = super_admin.id
      redirect_to admin_admins_url, :notice => "Logged in as SUPER Admin!"
    else
      flash.now.alert = "Invalid super admin email or password"
      render "new_super_admin"
    end
  end

  def destroy
    session[:super_admin_id] = nil
    session[:admin_id] = nil
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

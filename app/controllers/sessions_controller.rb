class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def new_admin
    render "new_admin"
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
      session[:user_id] = admin.id
      redirect_to users_url, :notice => "Logged in as Admin!"
    else
      flash.now.alert = "Invalid admin email or password"
      render "new_admin"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

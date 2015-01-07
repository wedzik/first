class UsersController < ApplicationController
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user ||= User.find(params[:id])
  end

  def profile
    if current_user
      flash.now[:notice] = ""
      @user ||= User.find(current_user.id)
    else
      redirect_to log_in_path
    end
  end

  def update
    @user ||= User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def   update_profile
    @user ||= User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end
end

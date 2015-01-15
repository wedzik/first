class UsersController < ApplicationController
  before_filter :require_admin_login , only: [:destroy, :index]

  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
    end
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def profile
    if current_user
      if current_user.is_a? Admin
        redirect_to admin_profile_path
        return
      end
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

  def update_profile
    @user ||= User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end
end

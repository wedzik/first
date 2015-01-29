class UsersController < ApplicationController

  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
    end
  end

  def index
    if params[:order]
      if  params[:direction] == 'up'
        @users = User.order(params[:order]+ " ASC")
        @direction = 'down'
      else
        @users = User.order(params[:order]+ " DESC")
        @direction = 'up'
      end
      @current = params[:order]
      #@current_order =
    else
      @users = User.all
      @current = 'id'
      @direction = 'up'
    end
    #order_by :date
    authorize! :index, User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        #flash.now[:notice] = "Signed up!"
        redirect_to log_in_path, :notice => "Signed up!"
      else
        render "new.js"
        #format.js
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
      authorize! :profile, @user
    else
      redirect_to log_in_path
    end
  end

  def reset_password
    @user ||= User.find(params[:id])
    authorize! :reset_password, @user
  end

  def save_password
    @user ||= User.find(params[:id])
    authorize! :save_password, @user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Password saved for #{@user.email}"
    end
    redirect_to users_path
  end

  def update
    @user ||= User.find(params[:id])
    authorize! :update, @user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def update_profile
    @user ||= User.find(params[:id])
    authorize! :update_profile, @user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end

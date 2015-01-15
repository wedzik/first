class Admin::AdminsController < ApplicationController

  before_filter :require_admin_login , only: [:profile, :edit, :show, :update_profile, :update]

  def new
    if current_user
      redirect_to profile_path
    else
      @admin = Admin.new
    end
  end

  def update
    @admin ||= User.find(params[:id])
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def profile
      flash.now[:notice] = ""
      @admin ||= Admin.find(current_user.id)
  end

  def update_profile
    @admin ||= Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to new_admin_admin_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @admin ||= Admin.find(params[:id])
  end

end
